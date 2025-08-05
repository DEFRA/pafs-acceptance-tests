@frontoffice
Feature: Run regression tests
   
  Scenario: Create a new defence proposal
  Given I sign in as a "rma" user
    And I create a new "new or improve asset" project 
    And I select a financial year to stop spending
   When I am returned to the proposal overview page
   Then I should see the project type is "Create a new flood or coastal erosion risk management asset, or improve the standard of service of an existing one"

  Scenario: Create a new restore asset proposal
  Given I sign in as a "rma" user
    And I create a new "restore asset" project
    And I select a financial year to stop spending
   When I am returned to the proposal overview page
   Then I should see the project type is "Restore the standard of service of a flood or coastal erosion risk management asset by refurbishment or replacement"

  Scenario: Create a new property level protection proposal and check very significant
    Given I sign in as a "rma" user
    And I create a new "property level protection" project
    And I select a financial year to stop spending
   When I am returned to the proposal overview page
   Then I should see the project type is "Add property level protection for properties within the 'very significant' flood band where there is a 5% or greater chance of flooding"
   
   Scenario: Created proposal and check it is in a draft status
    Given I sign in as a "rma" user
      And I create a new "new or improve asset" project
      And I select a financial year to stop spending
     When I return to the proposal overview page
     Then its status is Draft
     
  @smoke
  Scenario: Submit a new RMA project with multiple funding sources and no PFC
      Given I sign in as a "rma" user
      And I create a new "property level protection" project
      And I select a financial year to stop spending
      And I add a location "ST 58198 72725"
      And I upload a benefit area file "Valid_ShapeFile.zip"
      And I enter important project dates
      And I enter funding sources "grant_in_aid local_levy public_sector private_sector other_sector internal_drainage_boards not_identified"
      And I enter funding source contributors and values
      And I answer the earliest start date section
      And I add my project risks "tidal coastal"
      And I complete the flood protection outcome values
      And I complete the flood protection outcome values for 2040
      And I add the coastal erosion protection outcome values
      And I add the standard of protection before project starts as "very_significant_risk"
      And I add the standard of protection after project completes as "low_risk"
      And I add the standard of protection coastal erosion starts as "one_to_four_years"
      And I add the standard of protection after coastal erosion project completes as "less_that_ten_years"
      And I enter the projects goal approach "A new project with multi funding sources and no PFC"
      And I enter environmental outcomes improvements
      And I complete the natural flood measures task
      And I select the project urgency as "emergency" with a project message of "Because it is an Emergency"
      And I select the confidence page
      And I add the confidence in number of homes better protected by this project as "high"
      And I add the confidence in homes being delivered by the projects Gateway 4 date as "low"
      And I add the confidence in securing the required Partnership Funding as "not_applicable"
      And I select the carbon page
      And I add how much capital carbon will this project produce in tonnes "1"
      And I add how much carbon will this project’s assets produce in their lifecycle "2"
     When I submit my proposal
     Then I should see that my proposal is sent for review
     And its status is Submitted

  @smoke
   Scenario: Submit a new RMA project with multiple funding sources and PFC Vs2020 Calc
    Given I sign in as a "rma" user
      And I create a new "new or improve asset" project
      And I select a financial year to stop spending
      And I add a location "ST 58198 72725"
      And I upload a benefit area file "Valid_ShapeFile.zip"
      And I enter important project dates
      When I enter funding sources "grant_in_aid local_levy public_sector private_sector other_sector internal_drainage_boards not_identified fcrm_gia"
      And I enter FCRM grant in aid funding sources "asset_replacement environment_statutory frequently_flooded_communities other_gia other_gov summer_economic recovery"
      And I enter funding source contributors and values
      And I answer the earliest start date section
      And I add my project risks "tidal coastal"
      And I complete the flood protection outcome values
      And I complete the flood protection outcome values for 2040
      And I add the coastal erosion protection outcome values
      And I add the standard of protection before project starts as "very_significant_risk"
      And I add the standard of protection after project completes as "low_risk"
      And I add the standard of protection coastal erosion starts as "one_to_four_years"
      And I add the standard of protection after coastal erosion project completes as "less_that_ten_years"
      And I enter the projects goal approach "A new project with multi funding sources and PFC Vs2020 Calc"
      And I enter environmental outcomes improvements
      And I complete the natural flood measures task
      And I select the project urgency as "emergency" with a project message of "Because it is an Emergency"
      And I upload a project funding calculator file "Partnership_funding_calculator_2020_for_FCERM_Grant-in-Aid.xlsx"
      And I select the confidence page
      And I add the confidence in number of homes better protected by this project as "high"
      And I add the confidence in homes being delivered by the projects Gateway 4 date as "medium_low"
      And I add the confidence in securing the required Partnership Funding as "not_applicable"
      And I select the carbon page
      And I add how much capital carbon will this project produce in tonnes "1"
      And I add how much carbon will this project’s assets produce in their lifecycle "2"
     When I submit my proposal
     Then I should see that my proposal is sent for review
     And its status is Submitted

  @smoke
  Scenario: Submit a dual rma user proposal
    Given I sign in as a "dual_rma" user
      And I create a new proposal
      And I enter a new project name
      And I select a project area "Bristol City Council"
      And I select a project type "restore asset"
      And I select a financial year to stop spending
      And I add a location "ST 58198 72725"
      And I upload a benefit area file "Valid_ShapeFile.zip"
      And I enter important project dates
      And I enter funding sources "private_sector fcrm_gia"
      And I enter FCRM grant in aid funding sources "asset_replacement"
      And I enter funding source contributors and values
      And I answer the earliest start date section
      And I add my project risks "tidal coastal"
      And I complete the flood protection outcome values
      And I complete the flood protection outcome values for 2040
      And I add the coastal erosion protection outcome values
      And I add the standard of protection before project starts as "very_significant_risk"
      And I add the standard of protection after project completes as "low_risk"
      And I add the standard of protection coastal erosion starts as "one_to_four_years"
      And I add the standard of protection after coastal erosion project completes as "less_that_ten_years"
      And I enter the projects goal approach "A new project with multi funding sources and PFC Vs2020 Calc as PSO"
      And I enter environmental outcomes improvements
      And I complete the natural flood measures task
      And I select the project urgency as "emergency" with a project message of "Because it is an Emergency"
      And I upload a project funding calculator file "Partnership_funding_calculator_2020_for_FCERM_Grant-in-Aid.xlsx"
      And I select the confidence page
      And I add the confidence in number of homes better protected by this project as "high"
      And I add the confidence in homes being delivered by the projects Gateway 4 date as "low"
      And I add the confidence in securing the required Partnership Funding as "not_applicable"
      And I select the carbon page
      And I add how much capital carbon will this project produce in tonnes "1"
      And I add how much carbon will this project’s assets produce in their lifecycle "2"
     When I submit my proposal
     Then I should see that my proposal is sent for review
     And its status is Submitted
