#require 'rdiscount'
require 'yaml'

$: << './lib'
require 'course'
here = File.expand_path(File.dirname __FILE__)
def course
  Course.new(ENV['course'] || "learn_ruby")
end

desc "list all the lab dirs in the course dir in YAML, for help making new course.yaml files"
task :list_labs do
  puts Course.all_lab_names(course.curriculum_name).to_yaml
end

desc "build the course into its repo dir (default: course=learn_ruby)"
task :build do
  course.build
  puts "Built #{course.course_name} into #{course.repo_dir}"

  download_dir = "#{here}/download"
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

desc "run tests and specs of the framework"
task :test => :spec do
  Dir.glob("#{here}/test/*_test.rb") do |f|
    require f
  end
end

desc "run tests of the framework"
RSpec::Core::RakeTask.new(:spec) do |task|
  task.pattern = "spec/*_spec.rb"
end

task :default => :course

desc "run tests, exercises, and build the course (default: course=learn_ruby)"
task :course => :test do
  # run all exercises in all labs
  failed_labs = []
  # todo: use Course/Lab objects
  lab_dirs = FileList['learn_ruby/*'].select{|path| File.directory?(path)}
  lab_dirs.each do |lab|
    result = Dir.chdir(lab) do
      system "rake"
    end
    puts "#{lab} " + (result ? "passed" : "FAILED")
    puts ""
    failed_labs << lab if result == false
  end

  something_failed = (not failed_labs.empty?)
  if something_failed
    puts "#{failed_labs.size} of #{lab_dirs.size} failed labs"
    puts failed_labs.map{|c| "\t#{c}"}.join("\n")
  end

  exit 1 if something_failed

  # make the package
#  Rake::Task[:build].invoke
end

desc "launch the testfirst.org website on http://localhost:9292"
task :run do
  # system 'rerun "foreman start"'
  system 'rerun -- rackup -s thin'
end

desc "move index.md into test file"
task :unindex do
  require 'course'
  area = 'learn_ruby'
  Course.all_labs(area).each do |lab|
    begin
      notes = File.read(lab.notes_file)
      commented_notes = notes.gsub(/^/, '# ')
      tests = File.read(lab.test_file)
      # File.write(lab.test_file, tests)
      File.write(lab.test_file, commented_notes + "\n" + tests)
    rescue => e
      p e
    end
  end
end
