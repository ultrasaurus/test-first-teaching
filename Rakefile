require 'rdiscount'
require 'yaml'

$: << './lib'
require 'course'

desc "lists all the chapter dirs in the learn_ruby dir in YAML"
task :list_chapters do
  puts Course.all_chapters("learn_ruby").to_yaml
end

namespace :course do
  def course
    Course.new(ENV['course'] || "learn_ruby")
  end
  
  desc "build the course into its repo dir (default: course=learn_ruby)"
  task :build do
    course.build
  end
  
  desc "build the course into its repo dir and push it to github (default: course=learn_ruby)"
  task :push do
    c = course
    c.create_repo
    c.build
    c.push_repo
  end    
end

desc "convert all Erector pages into .html"
task :web do
  system "erector --to-html ./web"
end  

require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new(:test) do |task|
  task.pattern = "lib/*_spec.rb"
end
  
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
  Rake::Task[:"course:build"].invoke
end

task :foo do
  puts Dir.pwd
end

