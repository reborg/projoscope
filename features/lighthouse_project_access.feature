Feature: lighthouse project access
  In order to select a project on Lighthouse
  a Projoscope user
  types /lighthouse/username/projectname in the address bar
  
  Scenario: It shows the list of available projects if project not existing
    Given the name is "impossibleproject"
    When I add the lighthouse project name to the address bar
    Then I should see "Projects for user"

  Scenario: It shows the list of available projects when only the user name is given
    Given the name is ""
    When I add the lighthouse project name to the address bar
    Then I should see "Projects for user"

  Scenario: It shows project statistics
    Given the name is "Ruby on Rails"
    When I add the lighthouse project name to the address bar
    Then I should see "Statistics for project 'Ruby on Rails'"
