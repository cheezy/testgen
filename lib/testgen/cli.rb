require 'thor'
require 'testgen/generators/project'

module TestGen
  class CLI < Thor
    
    desc "project <project_name>", "Create a new test project"
    method_option :with_lib, :type => :boolean, :desc => "Place shared objects under lib directory"
    method_option :with_mohawk, :type => :boolean, :desc => 'Adds support for mohawk gem'
    method_option :with_appium, :type => :boolean, :desc => 'Add support for appium'

    def project(name)
      with_lib = options[:with_lib] ? 'true' : 'false'
      with_mohawk = options[:with_mohawk] ? 'true' : 'false'
      with_appium = options[:with_appium] ? 'true' : 'false'
      TestGen::Generators::Project.start([name, with_lib, with_mohawk, with_appium])
    end
    
  end
end
