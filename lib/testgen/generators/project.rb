require 'thor/group'
require 'sys/uname'

module TestGen
  module Generators
    class Project < Thor::Group
      include Thor::Actions
    
      argument :name, :type => :string, :desc => 'The name of the project'
      desc "Generates a project structure for testing with Cucumber"
      
      def self.source_root
        File.dirname(__FILE__) + "/project"
      end
    
      def create_top_directory
        empty_directory(name)
      end
      
      def copy_cucumber_yml
        template("cucumber.yml", "#{name}/cucumber.yml")
      end
    
      def copy_gemfile
        copy_file "Gemfile", "#{name}/Gemfile"
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
        copy_file "env.rb", "#{name}/features/support/env.rb"
      end
    end
  end
end