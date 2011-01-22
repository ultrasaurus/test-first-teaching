Dir.chdir Rake.application.original_dir

require 'jasmine'
load 'jasmine/tasks/jasmine.rake'

module Jasmine
  class Config
    def simple_config_file
      f = File.join(project_root, 'jasmine.yml')
      if File.exist?(f)
        f
      else
        File.join(project_root, '../jasmine.yml')
      end
    end
    
    def helpers
      match_files(project_root, simple_config['helpers'] || ["helpers/**/*.js"])
    end
    
  end
end
