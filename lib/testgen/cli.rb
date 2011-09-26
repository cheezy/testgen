require 'thor'
require 'testgen/generators/project'

module TestGen
  class CLI < Thor
    desc "project <project_name>", "Create a new test project"
    def project(name)
      TestGen::Generators::Project.start([name])
    end
  end
end