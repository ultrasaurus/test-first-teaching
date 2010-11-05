here = File.expand_path(File.dirname(__FILE__))

require 'course'
require 'wrong'
include Wrong
require 'tmpdir'

describe Course do
  it "can find the project root directory" do
    assert { Course.root.split('/').last == "test-first-teaching"  }
  end
  
  it "lists all chapters under the given curriculum" do
    chapters = Course.all_chapters("sample_curriculum")
    assert { chapters == ["one", "three", "two"] }
  end
  
  it 'initializes from a course yaml file' do
    c = Course.new(File.new("#{Course.root}/courses/sample_course.yaml"))
    assert { c.curriculum_name ==  "sample_curriculum" }
    assert { c.course_name ==  "sample_course" }
    assert { c.chapters == ["one", "two", "three"] }
    assert { c.repo == "git@github.com:alexch/sample_course.git"  }
  end

  it 'initializes from a course name (and looks in the courses dir for its yaml file)' do
    c = Course.new("sample_course")
    assert { c.curriculum_name ==  "sample_curriculum" }
    assert { c.course_name ==  "sample_course" }
    assert { c.chapters == ["one", "two", "three"] }
    assert { c.repo == "git@github.com:alexch/sample_course.git"  }
  end

  # it "uses learn_ruby by default" # implemented but needs a spec

  it "can find the repo directory" do
    c = Course.new("sample_course")
    assert { c.repo_dir ==  "#{Course.root}/../sample_course" }
  end

  describe "#build" do
    before do
      @course = Course.new("sample_course")
      @tmpdir = Dir.mktmpdir      
      @course.repo_dir = @tmpdir
      
      @course.build
    end
    
    after do
      # system "find #{@tmpdir}"
     FileUtils.remove_entry_secure @tmpdir
    end      

    def chapter_dirs
      ["00_one", "01_two", "02_three"]
    end

    it "numbers chapter directories in order" do
      chapter_dirs.each do |chapter_dir|
        assert { File.exists? "#{@tmpdir}/#{chapter_dir}" }
        assert { File.directory? "#{@tmpdir}/#{chapter_dir}" }
      end
    end
    
    it "copies normal files" do
      chapter_dirs.each do |chapter_dir|
        assert { File.exists? "#{@tmpdir}/#{chapter_dir}/foo_spec.rb" }
      end
    end
    
    it "excludes solutions" do
      chapter_dirs.each do |chapter_dir|
        deny { File.exists? "#{@tmpdir}/#{chapter_dir}/solution/foo.rb" }
      end
    end
      
    it "converts markdown files into html" do
      chapter_dirs.each do |chapter_dir|
        deny { File.exists? "#{@tmpdir}/#{chapter_dir}/stuff.md" }
        assert { File.exists? "#{@tmpdir}/#{chapter_dir}/stuff.html" }
      end
    end
    
    it "copies root-level files" do
      assert { File.exists? "#{@tmpdir}/tool" }
      assert { File.exists? "#{@tmpdir}/notes.html" }
    end
    
    it "clears away old contents (like previously generated chapter dirs)"
    
  end

end
