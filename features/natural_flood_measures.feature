Feature: Natural flood measures

As an EA service owner
I want project proposal owners to confirm if Natural Flood risk Measures are included in their projects and their associated value
So that the EA are informed of the NFMs that are included in projects and their value

Scenario: Completing all sections of Natural flood measures task completes task
    Given I sign in as a "rma" user
    And I create a new "change_or_new_asset" project
    And I select a financial year to stop spending
   When I select the natural flood measures task
    And I choose my project has natural flood risk measures
    And I select my natural flood measures
    And I enter my total cost of natural flood measures
    Then I can see the the natural flood risk measures in the proposal overview
    And I can see the total cost of my associated natural flood risk measures in the proposal overview

Scenario: Selecting no Natural flood measures completes Natural flood measures task
  Given I sign in as a "pso" user
    And I create a new "benefits_households_no" project
    And I select a financial year to stop spending
   When I select the natural flood measures task
    But I choose my project has no natural flood risk measures
   Then I can see the project does not include any flood risk measures in the proposal overview

   
