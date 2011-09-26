require 'thor/group'

module TestGen
  module Generators
    class Project < Thor::Group
      include Thor::Actions
    
      argument :name, :type => :string, :desc => 'The name of the project'
      desc "Generates a project structure for testing with Cucumber"
      
      def self.source_root
        File.dirname(__FILE__)
      end
    
      def create_top_directory
        empty_directory(name)
      end
    
    end
  end
end