require 'rake/packagetask'

Rake::PackageTask.new(:zip) do |spec|
  spec.name = "learn_ruby"
  spec.need_zip = true
  spec.package_files.include("learn_ruby/**/*_spec.rb")
  spec.package_files.include("learn_ruby/**/*_data.rb")
  spec.package_files.include("learn_ruby/**/*.html")
  spec.package_files.include("learn_ruby/sample_data/vehicles.rb")
  spec.version = "1.0.0"
end
