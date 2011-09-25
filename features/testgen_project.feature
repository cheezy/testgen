Feature: Generating a project with TestGen

  Scenario: Generating the directory structure
    When I run `testgen sample`
    Then the output should contain "generating sample directory"
