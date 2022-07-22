@risks
Feature: Project risks

What risks will the project protect against?


Scenario: Tidal flood risk protection outcomes for 2040 can be added to the proposal
    Given I sign in as a "rma" user
      And I create a new "new or improve asset" project
      And I select a financial year to stop spending
      And I add my project risk "tidal"
      And I add the flood protection outcome as none
     When I complete the flood protection outcome values for 2040
     Then I can see flood risk in the proposal overview

Scenario: Proposal that doesn't benefit any households does not have Risks and properties benefit section
  Given I sign in as a "pso" user
    And I create a new "no household benefit" project
    When I select a financial year to stop spending
    Then I will not be shown a risks and properties benefiting section

Scenario: Adding a coast risk protection requires coastal erosion protection outcome values
  Given I sign in as a "pso" user
    And I create a new "benefits households" project
    And I select a financial year to stop spending
    And I add my project risks "tidal coastal"
    And I complete the flood protection outcome values
    And I complete the flood protection outcome values for 2040
    When I add the coastal erosion protection outcome values
    Then I can see flood risk in the proposal overview
     And I can see "tidal" is the main project risk
