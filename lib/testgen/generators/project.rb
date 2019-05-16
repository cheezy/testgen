require 'thor/group'

module TestGen
  module Generators
    class Project < Thor::Group
      include Thor::Actions

      argument :name, :type => :string, :desc => 'The name of the project'
      argument :with_lib, :type => :string, :desc => 'Place all shared objects in the lib directory'
      argument :with_mohawk, :type => :string, :desc => 'Add support for the mohawk gem'
      argument :with_appium, :type => :string, :desc => 'Add support for appium gem'
      argument :with_config, :type => :string, :desc => 'Add config/environments directories and FigNewton gem'

      desc "Generates a project structure for testing with Cucumber"

      def self.source_root
        File.dirname(__FILE__) + "/project"
      end

      def create_top_directory
        empty_directory(name)
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

      def create_config_directories
        if gen_config
          empty_directory("#{name}/config")
          empty_directory("#{name}/config/environments")
        end
      end

      def copy_cucumber_yml
        if gen_config
          template "cucumber.yml.tt", "#{name}/config/cucumber.yml"
        else
          template "cucumber.yml.tt", "#{name}/cucumber.yml"
        end
      end

      def copy_env
        template "env.rb.tt", "#{name}/features/support/env.rb"
      end

      def copy_hooks
        template "hooks.rb.tt", "#{name}/features/support/hooks.rb" if gen_pageobject
      end

      def create_lib_directory
        empty_directory("#{name}/lib") if gen_lib
      end

      def create_pages_directory
        if gen_lib
          empty_directory("#{name}/lib/pages") if gen_pageobject
          empty_directory("#{name}/lib/screens") unless gen_pageobject
        else
          empty_directory("#{name}/features/support/pages") if gen_pageobject
          empty_directory("#{name}/features/support/screens") unless gen_pageobject
        end
      end

      private

      def gen_pageobject
        with_mohawk == 'false' && with_appium == 'false'
      end

      def gen_lib
        with_lib == 'true'
      end

      def gen_config
        with_config == 'true'
      end
    end
  end
end
