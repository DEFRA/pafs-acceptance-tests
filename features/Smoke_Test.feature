@frontoffice
Feature: Create a new project application for Smoke Tests
  As a council
  I want to submit a proposal for flood and coastal erosion risk management project funding
  So that my local area can have improved protection from flooding

  Background:
      Given I sign in as a "rma" user

  Scenario: Created proposal and check it is in a draft status
    Given I create a new "new or improve asset" project
      And I select a financial year to stop spending
     When I return to the proposal overview page
     Then its status is draft

    Scenario: Submit a new proposal with one funding source and PFC-Vs8 Calc
    Given I create a new "new or improve asset" project
      And I select a financial year to stop spending
      And I add a location "ST 58198 72725"
      And I upload a benefit area file "Valid_ShapeFile.zip"
      And I enter a business case start date
      And I enter an award contract date
      And I enter a construction start date
      And I enter a ready for service date
      And I enter a funding source for "grant_in_aid"
      And I enter funding values for single contributor "grant_in_aid" 
      And I enter a funding source for "local_levy"
      And I enter funding values for single contributor "local_levy" 
      And I answer YES if the project could start sooner "01", "2020"
      And I answer if the project could start sooner if grant in aid funding was made available earlier questions
      And I add my project risk "river"
      And I add the flood protection outcome as none
      And I complete the flood protection outcome values for 2040
      And I add the standard of protection before project starts as "very_significant_risk"
      And I add the standard of protection after project completes as "low_risk"
      And I enter the projects goal approach "Smoke Test on QA"
      And I enter environmental outcomes improvements
      And I complete the natural flood measures task
      And I select the project urgency as "emergency" with a project message of "Because it is an Emergency"
      And I upload a project funding calculator with file option "No", "PFCalcVs8.xlsx"
      And I select the confidence page
      And I add the confidence in number of homes better protected by this project as "high"
      And I add the confidence in homes being delivered by the projects Gateway 4 date as "low"
      And I add the confidence in securing the required Partnership Funding as "not_applicable"
      And I select the carbon page
      And I add how much capital carbon will this project produce in tonnes "1"
      And I add how much carbon will this project’s assets produce in their lifecycle "2"
     When I submit my proposal
     Then I should see that my proposal is sent for review

   Scenario: Submit a new proposal with one funding source and PFC-Vs2020 Calc 
    Given I create a new "new or improve asset" project
      And I select a financial year to stop spending
      And I add a location "ST 58198 72725"
      And I upload a benefit area file "Valid_ShapeFile.zip"
      And I enter a business case start date
      And I enter an award contract date
      And I enter a construction start date
      And I enter a ready for service date
      And I enter a funding source for "grant_in_aid"
      And I enter funding values for single contributor "grant_in_aid" 
      And I answer YES if the project could start sooner "03", "2020"
      And I add my project risks "tidal coastal"
      And I add the flood protection outcome as none
      And I add the flood protection 2040 outcome as none
      And I add the coastal erosion protection outcome as none
      And I add the standard of protection before project starts as "very_significant_risk"
      And I add the standard of protection after project completes as "low_risk"
      And I add the standard of protection coastal erosion starts as "one_to_four_years"
      And I add the standard of protection after coastal erosion project completes as "less_that_ten_years"
      And I enter the projects goal approach "A new smoke test training proposals with one funding source and PFC-Vs2020 Calc"
      And I enter environmental outcomes improvements
      And I complete the natural flood measures task
      And I enter the project urgency as "not_urgent"
      And I upload a project funding calculator with file option "Yes", "Partnership_funding_calculator_2020_for_FCERM_Grant-in-Aid.xlsx"
      And I select the confidence page
      And I add the confidence in number of homes better protected by this project as "high"
      And I add the confidence in homes being delivered by the projects Gateway 4 date as "medium_low"
      And I add the confidence in securing the required Partnership Funding as "not_applicable"
      And I select the carbon page
      And I add how much capital carbon will this project produce in tonnes "1"
      And I add how much carbon will this project’s assets produce in their lifecycle "2"
     When I submit my proposal
     Then I should see that my proposal is sent for review
