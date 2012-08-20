Feature: Adding the --with-gametel flag

  Scenario: Adding the require_all and gametel gems to Gemfile
    When I run `testgen project sample --with-gametel`
    Then a file named "sample/Gemfile" should exist
    And the file "sample/Gemfile" should contain "gem 'require_all'"
    And the file "sample/Gemfile" should contain "gem 'gametel'"

  Scenario: Adding page-object to env.rb
    When I run `testgen project sample --with-gametel`
    Then a file named "sample/features/support/env.rb" should exist
    And the file "sample/features/support/env.rb" should contain "require 'gametel'"
    And the file "sample/features/support/env.rb" should contain "World(Gametel::Navigation)"    

  Scenario: Should not create the hooks file
    When I run `testgen project sample --with-gametel`
    Then a file named "sample/features/support/hooks.rb" should not exist

  Scenario: Creating the pages directory under support
    When I run `testgen project sample --with-gametel`
    Then a directory named "sample/features/support/screens" should exist

  Scenario: Creating the pages directory under lib when using --wth-lib
    When I run `testgen project sample --with-gametel --with-lib`
    Then a directory named "sample/lib/screens" should exist
