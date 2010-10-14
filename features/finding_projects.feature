Feature: Finding a project on Lighthouse
  In order to see useful charts for a project
  a Projoscope user
  wants to use a special URL address to find the project
  
  Scenario: The project does not exist
    Given the project name is "NotExisting"
    When I fill in the name in the address bar and hit return
    Then I should see "does not exist"

  Scenario: The project name is not given
    Given the project name is ""
    When I fill in the name in the address bar and hit return
    Then I should see "does not exist"

  Scenario: The project does exist
    Given the project name is "pomodori"
    When I fill in the name in the address bar and hit return
    Then I should see "Statistics for project Pomodori"
