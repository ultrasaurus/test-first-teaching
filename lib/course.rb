here = File.expand_path(File.dirname(__FILE__))
require 'yaml'
require 'rdiscount'
require 'sass'

class Course
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
      "#{Course.root}/../#{course_name}"
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

    copy_files curriculum_dir, repo_dir, ""
    copy_files assets_dir, "#{repo_dir}/assets"
    
    @chapters.each_with_index do |chapter, i|
      num = "%02d" % i
      numbered = "#{num}_#{chapter}"
      source_dir = "#{curriculum_dir}/#{chapter}"
      target_dir = "#{@repo_dir}/#{numbered}"
      copy_files source_dir, target_dir
      copy_files "#{curriculum_dir}/ubiquitous", target_dir      
    end  
  end
  
  def copy_files(source_dir, target_dir, prefix = "../")
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
        input = File.read("#{source_dir}/#{input_file}")
        f.print Sass::Engine.new(input, :syntax => :scss).render
      end
    end

    markdown_files.each do |markdown_file|
      html_file = target_dir + "/" + markdown_file.gsub(/\.md$/, '.html')

      File.open(html_file, "w") do |f|
        f.print <<-HTML
<html>
<head>
  <title>Test-First Teaching: #{target_dir.split('/').last}</title>
  <link href="#{prefix}assets/style.css" media="screen" rel="stylesheet" type="text/css" /> 
</head>
<body>
  <div class='header'>
    <a href="http://testfirst.org">TestFirst.org</a>
  </div>
  <div class='content'>
        HTML
        markdown = File.read("#{source_dir}/#{markdown_file}")
        f.print Markdown.new(markdown).to_html
        
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
  
  
end
