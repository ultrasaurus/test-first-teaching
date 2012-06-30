here = File.expand_path(File.dirname(__FILE__))
require "#{here}/spec_helper"

require 'tmpdir'

require 'course'

describe Course do
  it "can find the project root directory" do
    assert { Course.root.split('/').last == "test-first-teaching"  }
  end

  it "lists all lab names under the given curriculum" do
    lab_names = Course.all_lab_names("sample_curriculum")
    assert { lab_names == ["one", "three", "two"] }
  end

  it "lists all labs under the given curriculum" do
    labs = Course.all_labs("sample_curriculum")
    lab_names = labs.map(&:name)
    assert { lab_names == ["one", "three", "two"] }
  end

  it 'initializes from a course yaml file' do
    c = Course.new(File.new("#{Course.root}/courses/sample_course.yaml"))
    assert { c.curriculum_name ==  "sample_curriculum" }
    assert { c.course_name ==  "sample_course" }
    assert { c.lab_names == ["one", "two", "three"] }
    assert { c.repo == "git@github.com:alexch/sample_course.git"  }
  end

  it 'initializes from a course name (and looks in the courses dir for its yaml file)' do
    c = Course.new("sample_course")
    assert { c.curriculum_name ==  "sample_curriculum" }
    assert { c.course_name ==  "sample_course" }
    assert { c.lab_names == ["one", "two", "three"] }
    assert { c.repo == "git@github.com:alexch/sample_course.git"  }
  end

  # it "uses learn_ruby by default" # implemented but needs a spec

  it "can find the repo directory" do
    c = Course.new("sample_course")
    assert { c.repo_dir ==  File.expand_path("#{Course.root}/../sample_course") }
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

    def lab_dirs
      ["00_one", "01_two", "02_three"]
    end

    it "numbers lab directories in order" do
      lab_dirs.each do |lab_dir|
        assert { File.exists? "#{@tmpdir}/#{lab_dir}" }
        assert { File.directory? "#{@tmpdir}/#{lab_dir}" }
      end
    end

    it "copies normal files" do
      lab_dirs.each do |lab_dir|
        assert { File.exists? "#{@tmpdir}/#{lab_dir}/foo_spec.rb" }
      end
    end

    it "excludes solutions" do
      lab_dirs.each do |lab_dir|
        deny { File.exists? "#{@tmpdir}/#{lab_dir}/solution/foo.rb" }
      end
    end

    it "converts markdown files into html" do
      lab_dirs.each do |lab_dir|
        deny { File.exists? "#{@tmpdir}/#{lab_dir}/stuff.md" }
        assert { File.exists? "#{@tmpdir}/#{lab_dir}/stuff.html" }
      end
    end

    it "extracts top notes from test files to make index.html" do
      lab_dir = "one"   # todo: other sample labs
      index_file = "#{@tmpdir}/00_#{lab_dir}/index.html"
      spec_file = "#{@tmpdir}/00_#{lab_dir}/#{lab_dir}_spec.rb"
      assert { File.exists? index_file }
      index_html = File.read(index_file)
      assert { index_html.include?(RspecFile.new(:file => spec_file).to_pretty) }
    end

    it "doesn't overwrite an existing index.html/md file with notes"

    it "copies the 'assets' dir" do
      assert { File.exists? "#{@tmpdir}/assets" }
      assert { File.directory? "#{@tmpdir}/assets" }
      assert { File.exists? "#{@tmpdir}/assets/style.css" }
    end

    it "copies root-level files" do
      assert { File.exists? "#{@tmpdir}/tool" }
      assert { File.exists? "#{@tmpdir}/notes.html" }
    end

    it "copies ubiquitous files" do
      lab_dirs.each do |lab_dir|
        assert { File.exists? "#{@tmpdir}/#{lab_dir}/ubiquity.txt" }
      end
    end

    it "clears away old contents (like previously generated lab dirs)" do
      lab_dir = "#{@tmpdir}/99_dummy"
      FileUtils.mkdir_p lab_dir
      File.open("#{lab_dir}/hello.txt", "w") do |f|
        f.write("hello")
      end
      assert { File.exists? "#{lab_dir}/hello.txt" }
      @course.build
      deny { File.exists? "#{lab_dir}/hello.txt" }
    end

    it "makes a nice Gemfile" do
      gemfile = "#{@tmpdir}/Gemfile"
      assert {File.exist? gemfile}
      assert {File.read(gemfile).include?("gem \"rake\"\n")}
    end

  end

end
