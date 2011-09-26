Feature: Generating a project with TestGen

  Scenario: Generating the top level project directory
    When I run `testgen project sample`
    Then a directory named "sample" should exist
    
    
