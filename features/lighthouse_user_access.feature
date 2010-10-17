Feature: lighthouse user access
  In order to select a user on Lighthouse
  a Projoscope user
  types /lighthouse/username in the address bar
  
  Scenario: The selected user does not exist
    Given the name is "notanuser"
    When I add the lighthouse user to the address bar
    Then I should see "user not found"

  Scenario: It shows instructions to access Lighthouse when no user name is given
    Given the name is ""
    When I add the lighthouse user to the address bar
    Then I should see "Lighthouse access instructions"

  Scenario: It shows the list of projects for a registered user on Lighthouse
    Given the name is "rails"
    When I add the lighthouse user to the address bar
    Then I should see "Projects for user 'Rails'"
