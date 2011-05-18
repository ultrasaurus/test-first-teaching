here = File.expand_path(File.dirname(__FILE__))
require 'yaml'
require 'rdiscount'
require 'sass'
require 'erector'

class Course
  include Erector::Mixin

  # todo: move to Curriculum object
  def self.all_chapters(curriculum_name)
    curriculum_dir = "#{Course.root}/#{curriculum_name}"
    chapters = Dir.glob("#{curriculum_dir}/*").
      select {|d| File.directory?(d)}.
      map {|d| d.split('/').last}.
      reject {|d| d == "ubiquitous" || d == "assets"}.
      sort
  end

  def self.root
    here = File.dirname(__FILE__)
    File.expand_path("#{here}/..")
  end

  attr_accessor :curriculum_name, :course_name, :chapters, :repo, :repo_dir

  def initialize(file)
    if file.is_a? String
      file = File.new("#{Course.root}/courses/#{file}.yaml")
    end
#    data = YAML::load_file(file)
    data = YAML::load(file.read)
    @curriculum_name = data[:curriculum] || "learn_ruby"
    @course_name = file.path.split('/').last.gsub(/\.yaml/, '')
    @chapters = data[:chapters]
    @repo = data[:repo] || "git@github.com:alexch/#{@course_name}.git"
    @repo_dir =
      File.expand_path "#{Course.root}/../#{course_name}"
  end

  def create_repo
    FileUtils.mkdir_p @repo_dir
    Dir.chdir(@repo_dir) do
      system "git init"
      system "git remote add origin #{@repo} 2>/dev/null"
      system "git pull origin master"
    end
  end

  def push_repo
    Dir.chdir(@repo_dir) do
      system "git add -A"
      system "git ci -m 'generated'"
      system "git push origin master"
    end
  end

  def curriculum_dir
    "#{Course.root}/#{@curriculum_name}"
  end

  def assets_dir
    "#{curriculum_dir}/assets"
  end

  def build
    FileUtils.rm_rf Dir.glob("#{@repo_dir}/*") # clear away old generated chapter dirs and files

    copy_files curriculum_dir, repo_dir, 0
    copy_files assets_dir, "#{repo_dir}/assets"

    @chapters.each_with_index do |chapter, i|
      num = "%02d" % i
      numbered = "#{num}_#{chapter}"
      source_dir = "#{curriculum_dir}/#{chapter}"
      target_dir = "#{@repo_dir}/#{numbered}"
      raise "Missing chapter #{source_dir}" unless File.exist? source_dir and File.directory? source_dir
      FileUtils.touch "#{source_dir}/index.md" unless File.exist?("#{source_dir}/index.md")
      copy_files source_dir, target_dir
      copy_files "#{curriculum_dir}/ubiquitous", target_dir
    end
  end

  def copy_files(source_dir, target_dir, level = 1)
    FileUtils.mkdir_p target_dir
    files = Dir.glob("#{source_dir}/*")
    markdown_files = []
    scss_files = []
    files = files.select do |file|
      if File.directory?(file)
        nil
      elsif file =~ /\.md$/
        markdown_files << file.split('/').last
        nil
      elsif file =~ /\.scss$/
        scss_files << file.split('/').last
      else
        true
      end
    end

    FileUtils.cp files, target_dir

    scss_files.each do |input_file|
      output_file = target_dir + "/" + input_file.gsub(/\.scss$/, '.css')
      File.open(output_file, "w") do |f|
        sass = Sass::Engine.for_file "#{source_dir}/#{input_file}", {}
        f.print sass.render
      end
    end

    markdown_files.each do |markdown_file|
      html_file = target_dir + "/" + markdown_file.gsub(/\.md$/, '.html')
      prefix = "../" * level
      current_chapter = source_dir.split('/').last

      File.open(html_file, "w") do |f|
        f.print <<-HTML
<html>
<head>
  <title>Test-First Teaching: #{course_name}: #{current_chapter}</title>
  <link href="#{prefix}assets/style.css" media="screen" rel="stylesheet" type="text/css" />
</head>
<body>
  <div class='header'>
    <h1><a href="/">TestFirst.org</a></h1>
    <h2>the home of test-first teaching</h2>
  </div>
  #{nav(current_chapter, level)}
  #{chapter_info(current_chapter, source_dir)}
  <div class='content'>
        HTML
        markdown = File.read("#{source_dir}/#{markdown_file}")
        html = Markdown.new(markdown).to_html
        f.print html
        f.print <<-HTML
  </div>
  <div class='footer'>
    <a href="http://testfirst.org">TestFirst.org</a>
  </div>
</body>
</html>
        HTML
      end
    end

  end
  def nav(current_chapter, level)

    erector {
      div(:class => 'nav') {
        h2 { a course_name, :href=> ("../" * level) + 'index.html' }
        b "Chapters:"
        ul {
          chapters.each_with_index do |chapter, i|
            num = "%02d" % i
            numbered = "#{num}_#{chapter}"
            li {
              if current_chapter == chapter
                text chapter
              else
                href = (if level == 0
                  "#{numbered}/"
                else
                  "../" * level + numbered + "/"
                end) + "index.html"
                a chapter, :href => href
              end
            }
          end
        }
      }
    }
  end

  def chapter_info(current_chapter, source_dir)
    erector {
      div(:class => "info") {
        h1 current_chapter
        ul {
          files = Dir.glob("#{source_dir}/*")
          files.each do |file|
            unless file =~ /\.(md|scss)/ or File.directory?(file)
              filename = file.split('/').last
              li { a filename, :href=>filename }
            end
          end
        }
      }
    }
  end


end
