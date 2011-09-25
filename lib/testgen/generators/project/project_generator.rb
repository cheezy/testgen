module TestGen
  class ProjectGenerator < Thor::Group
    include Thor::Actions
    
    argument :name
    
    def self.source_root
      File.dirname(__FILE__)
    end
    
    def gemfile
      copy_file 'Gemfile'
    end
    
    def rakefile
      copy_file 'Rakefile'
    end
    
    def features
      empty_directory 'features'
      
      inside 'features' do
        empty_directory 'support'
        empty_directory 'step_definitions'
      end
    end
    
  end
end