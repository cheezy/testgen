Feature: Adding the --with-gametel flag

  Scenario: Adding the require_all and appium gems to Gemfile
    When I run `testgen project sample --with-appium`
    Then a file named "sample/Gemfile" should exist
    And the file "sample/Gemfile" should contain "gem 'require_all'"
    And the file "sample/Gemfile" should contain "gem 'appium_lib'"
    And the file "sample/Gemfile" should contain "gem 'cucumber'"

  Scenario: Adding appium to env.rb
    When I run `testgen project sample --with-appium`
    Then a file named "sample/features/support/env.rb" should exist
    And the file "sample/features/support/env.rb" should contain "require 'appium_lib'"
    And the file "sample/features/support/env.rb" should contain "AppiumWorld.new"

  Scenario: Creating the keystore
    When I run `testgen project sample --with-appium`
    Then a file named "sample/features/support/env.rb" should exist
    And the file "sample/features/support/env.rb" should contain "@desired_caps = {"
    And the file "sample/features/support/env.rb" should contain "caps: {"
    And the file "sample/features/support/env.rb" should contain "platformName: 'android'"
    And the file "sample/features/support/env.rb" should contain "deviceName: ENV['DEVICE_NAME']"
    And the file "sample/features/support/env.rb" should contain "app: '<your_app>'"
    And the file "sample/features/support/env.rb" should contain "},"
    And the file "sample/features/support/env.rb" should contain "appium_lib: {"
    And the file "sample/features/support/env.rb" should contain "port: 4723"

  Scenario: Creating the Driver and hooks
    When I run `testgen project sample --with-appium`
    Then a file named "sample/features/support/env.rb" should exist
    And the file "sample/features/support/env.rb" should contain "Appium::Driver.new(@desired_caps).start_driver"
    And the file "sample/features/support/env.rb" should contain "Appium.promote_appium_methods Object"
    And the file "sample/features/support/env.rb" should contain "driver_quit"


  Scenario: Should not create the hooks file
    When I run `testgen project sample --with-appium`
    Then a file named "sample/features/support/hooks.rb" should not exist

  Scenario: Creating the screens directory under support
    When I run `testgen project sample --with-appium`
    Then a directory named "sample/features/support/screens" should exist

  Scenario: Creating the screens directory under lib when using --wth-lib
    When I run `testgen project sample --with-appium --with-lib`
    Then a directory named "sample/lib/screens" should exist
