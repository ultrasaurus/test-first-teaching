require 'rake/packagetask'
require 'rdiscount'

Rake::PackageTask.new(:zip) do |spec|
  spec.name = "learn_ruby"
  spec.need_zip = true
  spec.package_files.include("learn_ruby/**/*_spec.rb")
  spec.package_files.include("learn_ruby/**/*_data.rb")
  spec.package_files.include("learn_ruby/**/*.html")
  spec.package_files.include("learn_ruby/sample_data/vehicles.rb")
  spec.version = "1.0.0"
end

task :default do
  # convert all .md files into .html
  FileList['**/*.md'].each do |markdown_file|
    markdown = File.read(markdown_file)
    html_file = markdown_file.gsub(/\.md$/, '.html')
    puts "writing #{html_file}"
    File.open(html_file, "w") do |f|
      f.print Markdown.new(markdown).to_html
    end
  end
  
  # convert all Erector pages into .html
  system "erector --to-html web"
  
  # run all exercises
  failed_modules = 0
  modules = FileList['learn_ruby/*'].select{|path| File.directory?(path)}
  modules.each do |mod|
    result = Dir["#{mod}/*_spec.rb"].collect do |test_file| 
      system "learn_ruby/sspec #{test_file}"      
    end.uniq == [true]
    puts "#{mod} " + (result ? "passed" : "FAILED")
    puts
    failed_modules += 1 if result == false
  end
  puts "#{failed_modules} of #{modules.size} failed modules"
  
  # exit 1 if something_failed
  
  # make the package
  Rake::Task[:package].invoke
end
