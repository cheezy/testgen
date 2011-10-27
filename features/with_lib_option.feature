Feature: Adding the --with-lib flag

  Background:
    When I run `testgen project sample --with-lib --pageobject-driver=watir`

  Scenario: Adding the require_all gem to Gemfile
    Then a file named "sample/Gemfile" should exist
    And the file "sample/Gemfile" should contain "gem 'require_all'"
    And the file "sample/Gemfile" should contain "require_all 'lib'"
    
  Scenario: Creating the lib directory
    Then a directory named "sample/lib" should exist

  Scenario: Creating the pages directory in lib
    Then a directory named "sample/lib/pages" should exist
  