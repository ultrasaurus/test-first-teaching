here = File.expand_path(File.dirname(__FILE__))
require 'yaml'
require 'rdiscount'
require 'sass'
require 'erector'

require 'lab'
require 'rspec_file'

class Course
  include Erector::Mixin

  # todo: move to Curriculum object
  # todo: rename Curriculum to Area
  def self.all_lab_names(curriculum_name)
    curriculum_dir = "#{Course.root}/#{curriculum_name}"
    lab_names = Dir.glob("#{curriculum_dir}/*").
        select {|d| File.directory?(d)}.
        map {|d| d.split('/').last}.
        reject {|d| d == "ubiquitous" || d == "assets"}.
        sort
  end

  def self.all_labs(curriculum_name)
    all_lab_names(curriculum_name).map{|lab_name| Lab.new(curriculum_name, lab_name)}
  end

  def self.root
    here = File.dirname(__FILE__)
    File.expand_path("#{here}/..")
  end

  attr_accessor :curriculum_name, :course_name, :lab_names, :repo, :repo_dir, :repo_parent

  def initialize(file)
    if file.is_a? String
      file = File.new("#{Course.root}/courses/#{file}.yaml")
    end
#    data = YAML::load_file(file)  # this should work :-(
    data = YAML::load(file.read)
    @curriculum_name = data[:curriculum] || "learn_ruby"
    @course_name = file.path.split('/').last.gsub(/\.yaml/, '')
    @lab_names = data[:labs]
    @repo = data[:repo] || "git@github.com:alexch/#{@course_name}.git"
    @repo_parent =
        File.expand_path "#{Course.root}/.."
    @repo_dir =
        File.expand_path "#{@repo_parent}/#{course_name}"
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
      system "git commit -m 'generated'"
      system "git push origin master"
    end
  end

  #todo: move to Curriculum (Area) object
  def curriculum_dir
    "#{Course.root}/#{@curriculum_name}"
  end

  def assets_dir
    "#{curriculum_dir}/assets"
  end

  def lab_dir lab_name
    "#{curriculum_dir}/#{lab_name}"
  end

  def build
    FileUtils.rm_rf Dir.glob("#{@repo_dir}/*") # clear away old generated lab dirs and files

    copy_files curriculum_dir, repo_dir, 0
    copy_files assets_dir, "#{repo_dir}/assets"

    write_gemfile repo_dir

    @lab_names.each_with_index do |lab_name, i|
      num = "%02d" % i
      numbered = "#{num}_#{lab_name}"
      source_dir = lab_dir(lab_name)
      target_dir = "#{@repo_dir}/#{numbered}"
      raise "Missing lab #{source_dir}" unless File.exist? source_dir and File.directory? source_dir
      copy_files source_dir, target_dir
      copy_files "#{curriculum_dir}/ubiquitous", target_dir
      rspec_file = "#{source_dir}/#{lab_name}_spec.rb"

      # write notes as HTML
      if File.exist? rspec_file
        notes = RspecFile.new(:file => rspec_file)
        html = notes.to_pretty
        write_page "#{target_dir}/index.html", html, lab_name
      elsif File.exist?("#{source_dir}/index.md")
        # todo: test
        # don't overwrite index.html that was generated from index.md
        # skip
      else
        # todo: test
        write_page "#{target_dir}/index.html", "", lab_name
      end
    end
  end

  def build_tarball(into_dir)
    FileUtils.mkdir_p into_dir
    tarball = "#{into_dir}/#{course_name}.tgz"

    Dir.chdir(repo_parent) do
      `tar -z -c -f #{tarball} --exclude .git --exclude .gitignore  #{course_name}`
    end
  end

  def copy_files(source_dir, target_dir, level = 1)
    current_lab_name = source_dir.split('/').last

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
        nil
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
      output_file = target_dir + "/" + markdown_file.gsub(/\.md$/, '.html')

      markdown = File.read("#{source_dir}/#{markdown_file}")
      html = Markdown.new(markdown).to_html

      write_page output_file, html, current_lab_name, level
    end
  end

  def write_page output_file, html, lab_name, level = 1
    prefix = "../" * level
    source_dir = lab_dir(lab_name)   # todo: unify
    File.open(output_file, "w") do |f|
      f.print Course::Page.new(
                  :course_name => course_name,
                  :current_lab_name => lab_name,
                  :prefix => prefix,
                  :level => level,
                  :source_dir => source_dir,
                  :html => html,
                  :lab_names => @lab_names
              ).to_pretty
    end
  end

  def write_gemfile repo_dir
    gemfile_path = "#{repo_dir}/Gemfile"
    contents = <<-RUBY
source "https://rubygems.org"

gem "rake"
gem "rspec", ">=2.0"
    RUBY
    if course_name == "learn_javascript" #todo: use polymorphism or something
      contents += "gem \"jasmine\"\n"
    end
    File.write(gemfile_path, contents)
  end

  class Page < Erector::Widget
    # todo: use proper Erector Page object
    # todo: fewer parameters, ideally just a Course and a current_lab
    needs :course_name, :current_lab_name, :prefix, :level, :source_dir, :html, :lab_names

    def content
      html do
        head do
          title do
            text "Test-First Teaching: ", @course_name, ": ", @current_lab_name
          end
          link :href => "#{@prefix}assets/style.css", :media => 'screen', :rel => 'stylesheet', :type => 'text/css'
        end
        body do
          div :class => 'header' do
            h1 do
              a :href => 'http://testfirst.org' do
                text 'TestFirst.org'
              end
            end
            h2 do
              text 'the home of test-first teaching'
            end
          end
          nav_bar
          lab_info
          div :class => 'content' do
            text raw(@html)
          end
          div.footer {
            a "TestFirst.org", href: "http://testfirst.org"
          }
        end
      end
    end

    def nav_bar

      div(:class => 'nav') {
        h2 { a @course_name, :href=> ("../" * @level) + 'index.html' }
        b "Labs:"
        ul {
          @lab_names.each_with_index do |lab_name, i|
            num = "%02d" % i
            numbered = "#{num}_#{lab_name}"
            titled = "#{num} #{lab_name.split('_').map{|s|s.capitalize}.join(' ')}"
            li {
              if @current_lab_name == lab_name
                text titled
              else
                href = (if @level == 0
                          "#{numbered}/"
                        else
                          "../" * @level + numbered + "/"
                        end) + "index.html"
                a titled, :href => href
              end
            }
          end
        }
      }
    end

    def lab_info
      h1 @current_lab_name
    end

  end
end
