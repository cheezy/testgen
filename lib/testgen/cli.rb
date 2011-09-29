require 'thor'
require 'testgen/generators/project'

module TestGen
  class CLI < Thor
    
    desc "project <project_name>", "Create a new test project"
    method_option :pageobject_driver, :type => :string, :required => false, :desc => "Use the PageObject gem to drive browsers.  Valid values are 'watir' and 'selenium'"
    def project(name)
      driver = options[:pageobject_driver].nil? ? 'none' : options[:pageobject_driver]
      TestGen::Generators::Project.start([name, driver])
    end
    
  end
end