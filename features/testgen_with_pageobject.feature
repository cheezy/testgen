Feature: Adding support for the --pageobject-driver option


  Scenario: Adding page-object to the Gemfile
    When I run `testgen project sample`
    Then a file named "sample/Gemfile" should exist
    And the file "sample/Gemfile" should contain "gem 'page-object', '~> 2.0'"
    And the file "sample/Gemfile" should contain "gem 'data_magic'"

  Scenario: Adding page-object to env.rb
    When I run `testgen project sample`
    Then a file named "sample/features/support/env.rb" should exist
    And the file "sample/features/support/env.rb" should contain "require 'page-object'"
    And the file "sample/features/support/env.rb" should contain "require 'data_magic'"
    And the file "sample/features/support/env.rb" should contain "World(PageObject::PageFactory)"
    
  Scenario: Adding the hook file for Watir  
    When I run `testgen project sample`
    Then a file named "sample/features/support/hooks.rb" should exist
    And the file "sample/features/support/hooks.rb" should contain "require 'watir'"
    And the file "sample/features/support/hooks.rb" should contain "@browser = Watir::Browser.new :chrome"
    And the file "sample/features/support/hooks.rb" should contain "DataMagic.load_for_scenario(scenario)"

  Scenario: Creating the pages directory
    When I run `testgen project sample`
    Then a directory named "sample/features/support/pages" should exist
    
