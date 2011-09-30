Feature: Adding support for the --pageobject-driver option


  Scenario: Adding page-object to the Gemfile
    When I run `testgen project sample --pageobject-driver=watir`
    Then a file named "sample/Gemfile" should exist
    And the file "sample/Gemfile" should contain "gem 'page-object'"
    
  Scenario: Adding page-object to env.rb
    When I run `testgen project sample --pageobject-driver=watir`
    Then a file named "sample/features/support/env.rb" should exist
    And the file "sample/features/support/env.rb" should contain "require 'page-object'"
    And the file "sample/features/support/env.rb" should contain "require 'page-object/page_factory'"
    And the file "sample/features/support/env.rb" should contain "World(PageObject::PageFactory)"    
    
  Scenario: Adding the hook file for Watir  
    When I run `testgen project sample --pageobject-driver=watir`
    Then a file named "sample/features/support/hooks.rb" should exist
    And the file "sample/features/support/hooks.rb" should contain "require 'watir-webdriver'"
    And the file "sample/features/support/hooks.rb" should contain "@browser = Watir::Browser.new :firefox"
    
  Scenario: Adding the hook file for Selenium
    When I run `testgen project sample --pageobject-driver=selenium`
    Then a file named "sample/features/support/hooks.rb" should exist
    And the file "sample/features/support/hooks.rb" should contain "require 'selenium-webdriver'"
    And the file "sample/features/support/hooks.rb" should contain "@browser = Selenium::WebDriver.for :firefox"
  
  Scenario: Creating the pages directory
    When I run `testgen project sample --pageobject-driver=selenium`
    Then a directory named "sample/features/support/pages" should exist
    