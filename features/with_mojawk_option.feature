@focus
Feature: Adding the --with-mohawk flag

  Scenario: Adding the childprocess and mohawk gems to Gemfile
    When I run `testgen project sample --with-mohawk`
    Then a file named "sample/Gemfile" should exist
    And the file "sample/Gemfile" should contain "gem 'childprocess'"
    And the file "sample/Gemfile" should contain "gem 'mohawk'"
    And the file "sample/Gemfile" should contain "gem 'rake'"

  Scenario: Adding mohawk to env.rb
    When I run `testgen project sample --with-mohawk`
    Then a file named "sample/features/support/env.rb" should exist
    And the file "sample/features/support/env.rb" should contain "require 'childprocess'"
    And the file "sample/features/support/env.rb" should contain "require 'mohawk'"
    And the file "sample/features/support/env.rb" should contain "World(Mohawk::Navigation)"

  Scenario: Creating the Driver and hooks
    When I run `testgen project sample --with-mohawk`
    Then a file named "sample/features/support/env.rb" should exist
    And the file "sample/features/support/env.rb" should contain "@process = ChildProcess.build(PATH_TO_EXECUTABLE)"
    And the file "sample/features/support/env.rb" should contain "@process.start"
    And the file "sample/features/support/env.rb" should contain "RAutomation::WaitHelper.wait_until {RAutomation::Window.new(:pid => @process.pid).present?"
    And the file "sample/features/support/env.rb" should contain "@process.stop"


  Scenario: Should not create the hooks file
    When I run `testgen project sample --with-mohawk`
    Then a file named "sample/features/support/hooks.rb" should not exist

  Scenario: Creating the screens directory under support
    When I run `testgen project sample --with-mohawk`
    Then a directory named "sample/features/support/screens" should exist

  Scenario: Creating the screens directory under lib when using --wth-lib
    When I run `testgen project sample --with-mohawk --with-lib`
    Then a directory named "sample/lib/screens" should exist

