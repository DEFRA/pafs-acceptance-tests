Feature: Adding important dates to a proposal

Scenario: Important dates added to a proposal can be seen on the proposal overview page
    Given I sign in as a "rma" user
      And I create a new proposal
      And I enter a new project name
      And I select a project type "restore asset"
      And I select a financial year to stop spending
     When I enter a business case start date
      And I enter a business case completion date
      And I enter an award contract date
      And I enter a construction start date
      And I enter a ready for service date
     Then I can see the important dates in the proposal overview