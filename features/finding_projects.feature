Feature: Finding a project on Lighthouse
  In order to see useful charts for a project
  a Projoscope user
  wants to use a special URL address to find the project
  
  Scenario: The project does not exist
    Given the project name is "NotExisting"
    When I fill in the name in the address bar and hit return
    Then I should see "Project not found"

  Scenario: Landing on the home page
    Given the project name is ""
    When I fill in the name in the address bar and hit return
    Then I should see "Welcome to Projoscope"

  Scenario: The project does exist
    Given the project name is "Pomodori"
    When I fill in the name in the address bar and hit return
    Then I should see "Project Statistics"
