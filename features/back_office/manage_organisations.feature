Feature: Manage organisations

Scenario: Risk management authority (RMA) can be edited
 Given I sign into the back office as "paf1@example.com"
   And I choose to manage organisations
  When I search for "RMA" "West Somerset District Council"
   And I choose to edit the organisation
   And I update the organisation's id code
   Then I have successfully updated the organisation details
