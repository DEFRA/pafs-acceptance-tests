Feature: Partnership funding calculator uploaded

The partnership funding calculator generates a score for the project based on the benefits and outcomes that it aims to deliver and any contributions that it will raise. 
This score is used to prioritise and allocate funding in each year.

Scenario: Partnership funding calculator version 2 can be uploaded 
      Given I sign in as a "dual_rma" user
      And I create a new proposal
      And I enter a new project name
      And I select a project area "Bristol City Council"
      And I select a project type "restore asset"
      And I select a financial year to stop spending
      When I select the funding calculator task
      And I confirm the Outline Business Case be signed off after the 26th June 2020
      And I upload a project funding calculator file "Partnership_funding_calculator_2020_for_FCERM_Grant-in-Aid.xlsx"
      Then I can see the file has been uploaded in the summary page