require 'thor'
require 'testgen/generators/project'

module TestGen
  class CLI < Thor
    
    desc "project <project_name>", "Create a new test project"
    method_option :pageobject_driver, :type => :string, :required => false, :desc => "Use the PageObject gem to drive browsers.  Valid values are 'watir' and 'selenium'"
    method_option :with_lib, :type => :boolean, :desc => "Place shared objects under lib directory"
    method_option :with_gametel, :type => :boolean, :desc => "Add support for gametel gem"
    method_option :with_mohawk, :type => :boolean, :desc => 'Adds support for mohawk gem'
    def project(name)
      driver = options[:pageobject_driver].nil? ? 'none' : options[:pageobject_driver]
      with_lib = options[:with_lib] ? 'true' : 'false'
      with_gametel = options[:with_gametel] ? 'true' : 'false'
      with_mohawk = options[:with_mohawk] ? 'true' : 'false'
      TestGen::Generators::Project.start([name, driver, with_lib, with_gametel, with_mohawk])
    end
    
  end
end
