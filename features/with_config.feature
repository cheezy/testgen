Feature: Adding the --with_config flag
  As a cucumber author
  I want FigNewton and a config environment setup
  So that I can avoid manually configuring them for every project

  Background:
    When I run `testgen project sample --with_config`

  Scenario: Adding the fig_newton gem to Gemfile
    Then a file named "sample/Gemfile" should exist
    And the file "sample/Gemfile" should contain "gem 'fig_newton'"

  Scenario: Adding fig_newton to env.rb
    Then a file named "sample/features/support/env.rb" should exist
    And the file "sample/features/support/env.rb" should contain "require 'fig_newton'"

  Scenario: Creating the config set of directories
    Then the following directories should exist:
      | sample/config              |
      | sample/config/environments |

  Scenario: Generating the cucumber.yml file in the config folder
    Then a file named "sample/config/cucumber.yml" should exist
    And a file named "sample/cucumber.yml" should not exist
    And the file "sample/config/cucumber.yml" should contain "default: --no-source --color --format pretty"
