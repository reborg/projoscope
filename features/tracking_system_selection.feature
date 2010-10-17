Feature: tracking system selection
  In order to select a project to analyze
  a Projoscope user
  needs to follow the URL access rules 
  
  Scenario: The tracking system does not exist
    Given the name is "systemnotavailable"
    When I add the name to the address bar
    Then I should see "not supported"

  Scenario: Show currently supported tracking systems if the issue tracking is not selected
    Given the name is ""
    When I add the name to the address bar
    Then I should see "Issue tracking systems currently supported"

  Scenario: A registered issue tracking system is selected
    Given the name is "lighthouse"
    When I add the name to the address bar
    Then I should see "Lighthouse access usage information"
