Dir.chdir Rake.application.original_dir

require 'jasmine'
load 'jasmine/tasks/jasmine.rake'

def config_file
  project_root = File.dirname(__FILE__)
  f = File.join(project_root, 'jasmine.yml')
  if File.exist?(f)
    f
  else
    File.join(project_root, '../jasmine.yml')
  end
end

Rake::Task['jasmine:server'].clear

task "jasmine:server" => "jasmine:require" do
  port = ENV['JASMINE_PORT'] || 8888
  puts "your tests are here:"
  puts "  http://localhost:#{port}/"
  Jasmine.load_configuration_from_yaml(config_file)
  app = Jasmine::Application.app(Jasmine.config)
  Jasmine::Server.new(port, app).start
end

task "default" => "jasmine:server"
