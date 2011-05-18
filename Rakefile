require 'rdiscount'
require 'yaml'

$: << './lib'
require 'course'

def course
  Course.new(ENV['course'] || "learn_ruby")
end

desc "list all the chapter dirs in the course dir in YAML, for help making new course.yaml files"
task :list_chapters do
  puts Course.all_chapters(course.curriculum_name).to_yaml
end

desc "build the course into its repo dir (default: course=learn_ruby)"
task :build do
  course.build
  puts "Built #{course.course_name} into #{course.repo_dir}"

  download_dir = File.expand_path "#{File.dirname(__FILE__)}/download"
  course.build_tarball download_dir
  puts "Built tarball into #{download_dir}"
end

desc "build the course into its repo dir and push it to github (default: course=learn_ruby)"
task :push do
  c = course
  c.create_repo
  Rake::Task[:build].invoke
  c.push_repo # todo: exit on failure
  puts "Pushed #{course.course_name}"
end

require 'rspec/core/rake_task'

desc "run tests of the framework"
RSpec::Core::RakeTask.new(:test) do |task|
  task.pattern = "lib/*_spec.rb"
end

desc "run tests, exercises, and build the course (default: course=learn_ruby)"
task :default => :test do
  # run all exercises in all chapters
  failed_chapters = 0
  chapters = FileList['learn_ruby/*'].select{|path| File.directory?(path)}
  chapters.each do |mod|
    result = Dir["#{mod}/*_spec.rb"].collect do |test_file| 
      system "learn_ruby/sspec #{test_file}"      
    end.uniq == [true]
    puts "#{mod} " + (result ? "passed" : "FAILED")
    puts ""
    failed_chapters += 1 if result == false
  end
  puts "#{failed_chapters} of #{chapters.size} failed chapters"

  # exit 1 if something_failed

  # make the package
  Rake::Task[:build].invoke
end

desc "launch the testfirst.org website on http://localhost:9292"
task :run do
  system 'rerun "rackup config.ru"'
end
