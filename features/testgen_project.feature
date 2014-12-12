Feature: Generating a project with TestGen

  Background:
    When I run `testgen project sample`

  Scenario: Creating the top level project directory
    Then a directory named "sample" should exist
    
  Scenario: Generating the cucumber.yml file
    Then a file named "sample/cucumber.yml" should exist
    And the file "sample/cucumber.yml" should contain "default: --no-source --color --format pretty"
    
  Scenario: Generating the Gemfile file
    Then a file named "sample/Gemfile" should exist
    And the file "sample/Gemfile" should contain "gem 'cucumber'"
    And the file "sample/Gemfile" should contain "gem 'rspec'"
    And the file "sample/Gemfile" should contain "gem 'rake'"
    And the file "sample/Gemfile" should contain "source 'https://rubygems.org'"

    
  Scenario: Generating the Rakefile file
    Then a file named "sample/Rakefile" should exist
    And the file "sample/Rakefile" should contain "Cucumber::Rake::Task.new(:features)"
    And the file "sample/Rakefile" should contain exactly:
    """
    require 'rubygems'
    require 'cucumber'
    require 'cucumber/rake/task'

    Cucumber::Rake::Task.new(:features) do |t|
      t.profile = 'default'
    end

    task :default => :features
    """
  Scenario: Creating the features set of directories
    Then the following directories should exist:
      | sample/features                   |
      | sample/features/support           |
      | sample/features/step_definitions  |

  Scenario: Generating the env.rb file
    Then a file named "sample/features/support/env.rb" should exist
    And the file "sample/features/support/env.rb" should contain "require 'rspec'"
