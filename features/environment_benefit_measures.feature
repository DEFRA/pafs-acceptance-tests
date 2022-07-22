Feature: Environment benefit outcome measures

As an EA service owner
I want the Environment benefit outcomes to be updated to new approved outcome measures
So that the required outcome measures can be provided

Scenario: Completing all sections of Environment benefit outcomes completes task
    Given I sign in as a "rma" user
    And I create a new "new or improve asset" project
    And I select a financial year to stop spending
    When I enter environmental outcomes improvements
    Then I can see the environmental outcomes improvements totals in the proposal overview

Scenario: Selecting no Environment benefit outcomes completes task
  Given I sign in as a "pso" user
    And I create a new "no household benefit" project
    And I select a financial year to stop spending
   When I enter no environmental outcomes improvements
   Then I can see there are no environmental benefits in the proposal overview