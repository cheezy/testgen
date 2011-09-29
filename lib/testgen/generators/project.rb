require 'thor/group'
require 'sys/uname'

module TestGen
  module Generators
    class Project < Thor::Group
      include Thor::Actions
    
      argument :name, :type => :string, :desc => 'The name of the project'
      argument :pageobject_driver, :type => :string, :desc => 'Driver to use with PageObject'
      desc "Generates a project structure for testing with Cucumber"
      
      def self.source_root
        File.dirname(__FILE__) + "/project"
      end
    
      def create_top_directory
        empty_directory(name)
      end
      
      def copy_cucumber_yml
        template "cucumber.yml.tt", "#{name}/cucumber.yml"
      end
    
      def copy_gemfile
        template "Gemfile.tt", "#{name}/Gemfile"
      end
      
      def copy_rakefile
        copy_file "Rakefile", "#{name}/Rakefile"
      end
      
      def create_cucumber_directories
        empty_directory("#{name}/features")
        empty_directory("#{name}/features/support")
        empty_directory("#{name}/features/step_definitions")
      end
      
      def copy_env
        template "env.rb.tt", "#{name}/features/support/env.rb"
      end
      
      def copy_hooks
        template "hooks.rb.tt", "#{name}/features/support/hooks.rb" unless pageobject_driver.downcase == 'none'
      end
    end
  end
end