Feature: Adding the --with-mohawk flag

  Scenario: Adding the mohawk gems to Gemfile
    When I run `testgen project sample --with-mohawk`
    Then a file named "sample/Gemfile" should exist
    And the file "sample/Gemfile" should contain "gem 'mohawk', '~> 0.0.8'"
    And the file "sample/Gemfile" should contain "gem 'win32screenshot'"
    And the file "sample/Gemfile" should contain "gem 'rake'"

  Scenario: Adding mohawk to env.rb
    When I run `testgen project sample --with-mohawk`
    Then a file named "sample/features/support/env.rb" should exist
    And the file "sample/features/support/env.rb" should contain "require 'mohawk'"
    And the file "sample/features/support/env.rb" should contain "require 'win32/screenshot'"
    And the file "sample/features/support/env.rb" should contain "World(Mohawk::Navigation)"

  Scenario: Creating the Driver and hooks
    When I run `testgen project sample --with-mohawk`
    Then a file named "sample/features/support/env.rb" should exist
    And the file "sample/features/support/env.rb" should contain "Mohawk.app_path = PATH_TO_EXECUTABLE"
    And the file "sample/features/support/env.rb" should contain "Mohawk.start"
    And the file "sample/features/support/env.rb" should contain:
    """
    def capture_screenshot(name)
      Dir.mkdir('screenshots') unless Dir.exist? 'screenshots'
      now = Time.now.to_s.gsub(/\W+/, '.')
      Win32::Screenshot::Take.of(:desktop).write("screenshots/#{now}.#{name}.png")
    end
    """
    And the file "sample/features/support/env.rb" should contain:
    """
    After do |scenario|
      capture_screenshot(scenario.name.gsub(/\W+/,'_')) if scenario.failed?
      Mohawk.stop
    end
    """

  Scenario: Should not create the hooks file
    When I run `testgen project sample --with-mohawk`
    Then a file named "sample/features/support/hooks.rb" should not exist

  Scenario: Creating the screens directory under support
    When I run `testgen project sample --with-mohawk`
    Then a directory named "sample/features/support/screens" should exist

  Scenario: Creating the screens directory under lib when using --wth-lib
    When I run `testgen project sample --with-mohawk --with-lib`
    Then a directory named "sample/lib/screens" should exist

