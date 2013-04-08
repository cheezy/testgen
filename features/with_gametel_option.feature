@focus
Feature: Adding the --with-gametel flag

  Scenario: Adding the require_all and gametel gems to Gemfile
    When I run `testgen project sample --with-gametel`
    Then a file named "sample/Gemfile" should exist
    And the file "sample/Gemfile" should contain "gem 'require_all'"
    And the file "sample/Gemfile" should contain "gem 'gametel'"
    And the file "sample/Gemfile" should contain "gem 'rake'"

  Scenario: Adding gametel to env.rb
    When I run `testgen project sample --with-gametel`
    Then a file named "sample/features/support/env.rb" should exist
    And the file "sample/features/support/env.rb" should contain "require 'gametel'"
    And the file "sample/features/support/env.rb" should contain "World(Gametel::Navigation)"
    
  Scenario: Creating the keystore
    When I run `testgen project sample --with-gametel`
    Then a file named "sample/features/support/env.rb" should exist
    And the file "sample/features/support/env.rb" should contain "keystore = {"
    And the file "sample/features/support/env.rb" should contain ":path => File.expand_path('~/.android/debug.keystore')"
    And the file "sample/features/support/env.rb" should contain ":alias => 'androiddebugkey'"
    And the file "sample/features/support/env.rb" should contain ":password => 'android'"
    And the file "sample/features/support/env.rb" should contain ":keystore_password => 'android'"
    
  Scenario: Creating the Driver and hooks
    When I run `testgen project sample --with-gametel`
    Then a file named "sample/features/support/env.rb" should exist
    And the file "sample/features/support/env.rb" should contain "@driver = Gametel.start(ACTIVITY_NAME_GOES_HERE, keystore)"
    And the file "sample/features/support/env.rb" should contain "Gametel.stop"
    And the file "sample/features/support/env.rb" should contain "Gametel.apk_path = PATH_TO_APK"
    

  Scenario: Should not create the hooks file
    When I run `testgen project sample --with-gametel`
    Then a file named "sample/features/support/hooks.rb" should not exist

  Scenario: Creating the screens directory under support
    When I run `testgen project sample --with-gametel`
    Then a directory named "sample/features/support/screens" should exist

  Scenario: Creating the screens directory under lib when using --wth-lib
    When I run `testgen project sample --with-gametel --with-lib`
    Then a directory named "sample/lib/screens" should exist
