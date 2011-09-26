Feature: Generating a project with TestGen

  Background:
    When I run `testgen project sample`

  Scenario: Generating the top level project directory
    Then a directory named "sample" should exist
    
  Scenario: Generating the cucumber.yml file
    Then a file named "sample/cucumber.yml" should exist
    And the file "sample/cucumber.yml" should contain "default: --no-source --color --format pretty"
    
  Scenario: Generating the Gemfile file
    Then a file named "sample/Gemfile" should exist
    And the file "sample/Gemfile" should contain "gem 'cucumber'"
    And the file "sample/Gemfile" should contain "gem 'rspec'"
    
