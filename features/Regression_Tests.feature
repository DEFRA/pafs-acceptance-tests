@frontoffice
Feature: Run regression tests
   
  Scenario: Submit a new defence proposal
  Given I sign in as a "rma" user
    And I create a new "change_or_new_asset" project 
    And I select a financial year to stop spending
   When I am returned to the proposal overview page
   Then I should see the project type is "Create a new flood or coastal erosion risk management asset, or improve the standard of service of an existing one"

  Scenario: Submit a new restore asset proposal
  Given I sign in as a "rma" user
    And I create a new "restore_asset" project
    And I select a financial year to stop spending
   When I am returned to the proposal overview page
   Then I should see the project type is "Restore the standard of service of a flood or coastal erosion risk management asset by refurbishment or replacement"

  Scenario: Submit a new property level protection proposal and check very significant
    Given I sign in as a "rma" user
    And I create a new "property_level_protection" project
    And I select a financial year to stop spending
   When I am returned to the proposal overview page
   Then I should see the project type is "Add property level protection for properties within the 'very significant' flood band where there is a 5% or greater chance of flooding"

  Scenario: Submit a new proposal with a valid shapefile
    Given I sign in as a "rma" user
    And I create a new "change_or_new_asset" project
    And I select a financial year to stop spending
    And I add a location "ST 58198 72725"
   When I upload the benefit area file "Valid_ShapeFile.zip"
   Then I should see the message "The uploaded shapefile" on the benefit area page

  Scenario Outline: Submit a new proposal with an invalid shapefile
    Given I sign in as a "rma" user
    And I create a new "change_or_new_asset" project
    And I select a financial year to stop spending
    And I add a location "ST 58198 72725"
    When I upload the benefit area file "<ShapeFile>"
    Then I should see the message "<Message>" on the benefit file page

    Examples:
    |ShapeFile            |Message                                                                                            |
    |ShapeFile.png        |The selected file must be a zip file, containing the following mandatory files: dbf. shx. shp. prj.|
    |Invalid_ShapeFile.zip|The selected file must be a zip file, containing the following mandatory files: dbf. shx. shp. prj.|

  Scenario: Submit a new proposal with no shapefile
    Given I sign in as a "rma" user
    And I create a new "change_or_new_asset" project
    And I select a financial year to stop spending
    And I add a location "ST 58198 72725"
    And I click and continue
   Then I should see the message "Upload a shapefile that outlines the area the project is likely to benefit" on the benefit file page

  Scenario Outline: Submit a new proposal with invalid shapefile
    Given I sign in as a "rma" user
    And I create a new "change_or_new_asset" project
    And I select a financial year to stop spending
    And I add a location "ST 58198 72725"
   When I upload the benefit area file "<ShapeFile>"
   Then I should see the message "<Message>" on the benefit file page

    Examples:
    |ShapeFile            |Message                                                                                            |
    |Invalid_ShapeFile.zip|The selected file must be a zip file, containing the following mandatory files: dbf. shx. shp. prj.|
     
Scenario Outline: Submit a new proposals with a single funding source 
  Given I sign in as a "rma" user
     
    And I create a new "change_or_new_asset" project
    And I select a financial year to stop spending
    And I add a location "ST 58198 72725"
    And I upload a benefit area file "Valid_ShapeFile.zip"
    And I enter a business case start date
    And I enter an award contract date
    And I enter a construction start date
    And I enter a ready for service date
    And I enter a funding source for "grant_in_aid"
    And I enter funding values for single contributor "grant_in_aid"
   When I am returned to the proposal overview page
   Then I should see the total estimated spend as "36,000"
    And I should see the funding source contributor "grant_in_aid"

  Scenario: Submit a new RMA project with triple funding sources and PFC Vs8 Calc
      Given I sign in as a "rma" user
      And I create a new "restore_asset" project
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
      And I enter a funding source for "growth_funding"
      And I enter funding values for single contributor "growth_funding" 
      And I enter a funding source for "internal_drainage_boards"
      And I enter funding values for single contributor "internal_drainage_boards" 
      And I enter a funding source for "not_identified"
      And I enter funding values for single contributor "not_identified" 
      And I enter a funding source for "public_sector"
      And I enter a new sector contributor
      And I enter funding values for single contributor "public_sector" 
      And I click and continue
      And I enter a funding source for "private_sector"
      And I click and continue
      And I click and continue
      And I enter a new sector contributor
      And I enter funding values for single contributor "private_sector" 
      And I click and continue
      And I enter a funding source for "other_sector"
      And I click and continue
      And I click and continue
      And I click and continue
      And I click and continue      
      And I enter a new sector contributor
      And I enter funding values for single contributor "other_sector"  
      And I click and continue
      And I answer YES if the project could start sooner "01", "2020"
      And I add my main project risk "tidal"
      And I add the flood protection outcome values for column A a1 "3000", a2 "3000", a3 "3000", a4 "3000", a5 "3000", a6 "3000", a7 "3000", column B b1 "2000", b2 "2000", b3 "2000", b4 "2000", b5 "2000", b6 "2000", b7 "2000", column C c1 "1000", c2 "1000", c3 "1000", c4 "1000", c5 "1000", c6 "1000", c7 "1000"
      And I add a second project risk "coastal"
      And I click and continue
      And I click and continue
      And I add the coastal erosion protection outcome values for column A a1 "3000", a2 "3000", a3 "3000", a4 "3000", a5 "3000", a6 "3000", a7 "3000", column B b1 "2000", b2 "2000", b3 "2000", b4 "2000", b5 "2000", b6 "2000", b7 "2000", column C c1 "1000", c2 "1000", c3 "1000", c4 "1000", c5 "1000", c6 "1000", c7 "1000"
      And I add the standard of protection before project starts as "very_significant_risk"
      And I add the standard of protection after project completes as "low_risk"
      And I add the standard of protection coastal erosion starts as "one_to_four_years"
      And I add the standard of protection after coastal erosion project completes as "less_that_ten_years"
      And I enter the projects goal approach "A new project with multi funding sources and PFC Vs8 Calc"
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
  @smoke
   Scenario: Submit a new RMA project with multi funding sources and PFC Vs2020 Calc
    Given I sign in as a "rma" user
      And I create a new "restore_asset" project
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
      And I enter a funding source for "growth_funding"
      And I enter funding values for single contributor "growth_funding" 
      And I enter a funding source for "internal_drainage_boards"
      And I enter funding values for single contributor "internal_drainage_boards" 
      And I enter a funding source for "not_identified"
      And I enter funding values for single contributor "not_identified" 
      And I enter a funding source for "public_sector"
      And I enter a new sector contributor
      And I enter funding values for single contributor "public_sector" 
      And I click and continue
      And I enter a funding source for "private_sector"
      And I click and continue
      And I click and continue
      And I enter a new sector contributor
      And I enter funding values for single contributor "private_sector" 
      And I click and continue
      And I enter a funding source for "other_sector"
      And I click and continue
      And I click and continue
      And I click and continue
      And I click and continue      
      And I enter a new sector contributor
      And I enter funding values for single contributor "other_sector" 
      And I click and continue
      And I answer YES if the project could start sooner "01", "2020"
      And I add my main project risk "tidal"
      And I add the flood protection outcome values for column A a1 "3000", a2 "3000", a3 "3000", a4 "3000", a5 "3000", a6 "3000", a7 "3000", column B b1 "2000", b2 "2000", b3 "2000", b4 "2000", b5 "2000", b6 "2000", b7 "2000", column C c1 "1000", c2 "1000", c3 "1000", c4 "1000", c5 "1000", c6 "1000", c7 "1000"
      And I add a second project risk "coastal"
      And I click and continue
      And I click and continue
      And I add the coastal erosion protection outcome values for column A a1 "3000", a2 "3000", a3 "3000", a4 "3000", a5 "3000", a6 "3000", a7 "3000", column B b1 "2000", b2 "2000", b3 "2000", b4 "2000", b5 "2000", b6 "2000", b7 "2000", column C c1 "1000", c2 "1000", c3 "1000", c4 "1000", c5 "1000", c6 "1000", c7 "1000"
      And I add the standard of protection before project starts as "very_significant_risk"
      And I add the standard of protection after project completes as "low_risk"
      And I add the standard of protection coastal erosion starts as "one_to_four_years"
      And I add the standard of protection after coastal erosion project completes as "less_that_ten_years"
      And I enter the projects goal approach "A new project with multi funding sources and PFC Vs2020 Calc"
      And I enter environmental outcomes improvements
      And I complete the natural flood measures task
      And I select the project urgency as "emergency" with a project message of "Because it is an Emergency"
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

   Scenario: Submit a new RMA project with multi funding sources and PFC Vs8 Calc
    Given I sign in as a "rma" user
      And I create a new "restore_asset" project
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
      And I enter a funding source for "growth_funding"
      And I enter funding values for single contributor "growth_funding" 
      And I enter a funding source for "internal_drainage_boards"
      And I enter funding values for single contributor "internal_drainage_boards" 
      And I enter a funding source for "not_identified"
      And I enter funding values for single contributor "not_identified" 
      And I enter a funding source for "public_sector"
      And I enter a new sector contributor
      And I enter funding values for single contributor "public_sector" 
      And I click and continue
      And I enter a funding source for "private_sector"
      And I click and continue
      And I click and continue
      And I enter a new sector contributor
      And I enter funding values for single contributor "private_sector" 
      And I click and continue
      And I enter a funding source for "other_sector"
      And I click and continue
      And I click and continue
      And I click and continue
      And I click and continue      
      And I enter a new sector contributor
      And I enter funding values for single contributor "other_sector"  
      And I click and continue
      And I answer YES if the project could start sooner "01", "2020"
      And I add my main project risk "tidal"
      And I add the flood protection outcome values for column A a1 "3000", a2 "3000", a3 "3000", a4 "3000", a5 "3000", a6 "3000", a7 "3000", column B b1 "2000", b2 "2000", b3 "2000", b4 "2000", b5 "2000", b6 "2000", b7 "2000", column C c1 "1000", c2 "1000", c3 "1000", c4 "1000", c5 "1000", c6 "1000", c7 "1000"
      And I add a second project risk "coastal"
      And I click and continue
      And I click and continue
      And I add the coastal erosion protection outcome values for column A a1 "3000", a2 "3000", a3 "3000", a4 "3000", a5 "3000", a6 "3000", a7 "3000", column B b1 "2000", b2 "2000", b3 "2000", b4 "2000", b5 "2000", b6 "2000", b7 "2000", column C c1 "1000", c2 "1000", c3 "1000", c4 "1000", c5 "1000", c6 "1000", c7 "1000"
      And I add the standard of protection before project starts as "very_significant_risk"
      And I add the standard of protection after project completes as "low_risk"
      And I add the standard of protection coastal erosion starts as "one_to_four_years"
      And I add the standard of protection after coastal erosion project completes as "less_that_ten_years"
      And I enter the projects goal approach "A new project with multi funding sources and PFC Vs2020 Calc"
      And I enter environmental outcomes improvements
      And I complete the natural flood measures task
      And I select the project urgency as "emergency" with a project message of "Because it is an Emergency"
      And I upload a project funding calculator with file option "No", "PFCalcVs8.xlsx"
      And I select the confidence page
      And I add the confidence in number of homes better protected by this project as "high"
      And I add the confidence in homes being delivered by the projects Gateway 4 date as "medium_low"
      And I add the confidence in securing the required Partnership Funding as "not_applicable"
      And I select the carbon page
      And I add how much capital carbon will this project produce in tonnes "1"
      And I add how much carbon will this project’s assets produce in their lifecycle "2"
     When I submit my proposal
     Then I should see that my proposal is sent for review

   Scenario: Submit a new RMA project with multi funding sources and PFC Vs8 Calc
    Given I sign in as a "rma" user
      And I create a new "change_or_new_asset" project
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
      And I enter a funding source for "growth_funding"
      And I enter funding values for single contributor "growth_funding" 
      And I enter a funding source for "internal_drainage_boards"
      And I enter funding values for single contributor "internal_drainage_boards" 
      And I enter a funding source for "not_identified"
      And I enter funding values for single contributor "not_identified" 
      And I enter a funding source for "public_sector"
      And I enter a new sector contributor
      And I enter funding values for single contributor "public_sector" 
      And I click and continue
      And I enter a funding source for "private_sector"
      And I click and continue
      And I click and continue
      And I enter a new sector contributor
      And I enter funding values for single contributor "private_sector" 
      And I click and continue
      And I enter a funding source for "other_sector"
      And I click and continue
      And I click and continue
      And I click and continue
      And I click and continue      
      And I enter a new sector contributor
      And I enter funding values for single contributor "other_sector"  
      And I click and continue
      And I answer YES if the project could start sooner "01", "2020"
      And I add my main project risk "tidal"
      And I add the flood protection outcome values for column A a1 "3000", a2 "3000", a3 "3000", a4 "3000", a5 "3000", a6 "3000", a7 "3000", column B b1 "2000", b2 "2000", b3 "2000", b4 "2000", b5 "2000", b6 "2000", b7 "2000", column C c1 "1000", c2 "1000", c3 "1000", c4 "1000", c5 "1000", c6 "1000", c7 "1000"
      And I add a second project risk "coastal"
      And I click and continue
      And I click and continue
      And I add the coastal erosion protection outcome values for column A a1 "3000", a2 "3000", a3 "3000", a4 "3000", a5 "3000", a6 "3000", a7 "3000", column B b1 "2000", b2 "2000", b3 "2000", b4 "2000", b5 "2000", b6 "2000", b7 "2000", column C c1 "1000", c2 "1000", c3 "1000", c4 "1000", c5 "1000", c6 "1000", c7 "1000"
      And I add the standard of protection before project starts as "very_significant_risk"
      And I add the standard of protection after project completes as "low_risk"
      And I add the standard of protection coastal erosion starts as "one_to_four_years"
      And I add the standard of protection after coastal erosion project completes as "less_that_ten_years"
      And I enter the projects goal approach "A new project with multi funding sources and PFC Vs2020 Calc"
      And I enter environmental outcomes improvements
      And I complete the natural flood measures task
      And I select the project urgency as "emergency" with a project message of "Because it is an Emergency"
      And I upload a project funding calculator with file option "No", "PFCalcVs8.xlsx"
      And I select the confidence page
      And I add the confidence in number of homes better protected by this project as "high"
      And I add the confidence in homes being delivered by the projects Gateway 4 date as "medium_low"
      And I add the confidence in securing the required Partnership Funding as "not_applicable"
      And I select the carbon page
      And I add how much capital carbon will this project produce in tonnes "1"
      And I add how much carbon will this project’s assets produce in their lifecycle "2"
     When I submit my proposal
     Then I should see that my proposal is sent for review

  Scenario: Submit a new PSO project with multi funding sources and PFC Vs8 Calc
    Given I sign in as a "rma" user
      And I create a new "restore_asset" project
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
      And I enter a funding source for "growth_funding"
      And I enter funding values for single contributor "growth_funding" 
      And I enter a funding source for "internal_drainage_boards"
      And I enter funding values for single contributor "internal_drainage_boards" 
      And I enter a funding source for "not_identified"
      And I enter funding values for single contributor "not_identified" 
      And I enter a funding source for "public_sector"
      And I enter a new sector contributor
      And I enter funding values for single contributor "public_sector" 
      And I click and continue
      And I enter a funding source for "private_sector"
      And I click and continue
      And I click and continue
      And I enter a new sector contributor
      And I enter funding values for single contributor "private_sector" 
      And I click and continue
      And I enter a funding source for "other_sector"
      And I click and continue
      And I click and continue
      And I click and continue
      And I click and continue      
      And I enter a new sector contributor
      And I enter funding values for single contributor "other_sector" 
      And I click and continue
      And I answer YES if the project could start sooner "01", "2020"
      And I add my main project risk "tidal"
      And I add the flood protection outcome values for column A a1 "3000", a2 "3000", a3 "3000", a4 "3000", a5 "3000", a6 "3000", a7 "3000", column B b1 "2000", b2 "2000", b3 "2000", b4 "2000", b5 "2000", b6 "2000", b7 "2000", column C c1 "1000", c2 "1000", c3 "1000", c4 "1000", c5 "1000", c6 "1000", c7 "1000"
      And I add a second project risk "coastal"
      And I click and continue
      And I click and continue
      And I add the coastal erosion protection outcome values for column A a1 "3000", a2 "3000", a3 "3000", a4 "3000", a5 "3000", a6 "3000", a7 "3000", column B b1 "2000", b2 "2000", b3 "2000", b4 "2000", b5 "2000", b6 "2000", b7 "2000", column C c1 "1000", c2 "1000", c3 "1000", c4 "1000", c5 "1000", c6 "1000", c7 "1000"
      And I add the standard of protection before project starts as "very_significant_risk"
      And I add the standard of protection after project completes as "low_risk"
      And I add the standard of protection coastal erosion starts as "one_to_four_years"
      And I add the standard of protection after coastal erosion project completes as "less_that_ten_years"
      And I enter the projects goal approach "A new project with multi funding sources and PFC Vs8 Calc"
      And I enter environmental outcomes improvements
      And I complete the natural flood measures task
      And I select the project urgency as "emergency" with a project message of "Because it is an Emergency"
      And I upload a project funding calculator with file option "No", "PFCalcVs8.xlsx"
      And I select the confidence page
      And I add the confidence in number of homes better protected by this project as "high"
      And I add the confidence in homes being delivered by the projects Gateway 4 date as "medium_low"
      And I add the confidence in securing the required Partnership Funding as "not_applicable"
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

  Scenario: Submit a new PSO project with multi funding sources and PFC Vs2020 Calc
    Given I sign in as a "pso" user
      And I create a new proposal
      And I enter a new project name
      And I select a project area "Bristol City Council"
      And I select a project type "restore_asset"
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
      And I enter a funding source for "growth_funding"
      And I enter funding values for single contributor "growth_funding" 
      And I enter a funding source for "internal_drainage_boards"
      And I enter funding values for single contributor "internal_drainage_boards" 
      And I enter a funding source for "not_identified"
      And I enter funding values for single contributor "not_identified" 
      And I enter a funding source for "public_sector"
      And I enter a new sector contributor
      And I enter funding values for single contributor "public_sector" 
      And I click and continue
      And I enter a funding source for "private_sector"
      And I click and continue
      And I click and continue
      And I enter a new sector contributor
      And I enter funding values for single contributor "private_sector" 
      And I click and continue
      And I enter a funding source for "other_sector"
      And I click and continue
      And I click and continue
      And I click and continue
      And I click and continue      
      And I enter a new sector contributor
      And I enter funding values for single contributor "other_sector"  
      And I click and continue
      And I answer YES if the project could start sooner "01", "2020"
      And I add my main project risk "tidal"
      And I add the flood protection outcome values for column A a1 "3000", a2 "3000", a3 "3000", a4 "3000", a5 "3000", a6 "3000", a7 "3000", column B b1 "2000", b2 "2000", b3 "2000", b4 "2000", b5 "2000", b6 "2000", b7 "2000", column C c1 "1000", c2 "1000", c3 "1000", c4 "1000", c5 "1000", c6 "1000", c7 "1000"
      And I add a second project risk "coastal"
      And I click and continue
      And I click and continue
      And I add the coastal erosion protection outcome values for column A a1 "3000", a2 "3000", a3 "3000", a4 "3000", a5 "3000", a6 "3000", a7 "3000", column B b1 "2000", b2 "2000", b3 "2000", b4 "2000", b5 "2000", b6 "2000", b7 "2000", column C c1 "1000", c2 "1000", c3 "1000", c4 "1000", c5 "1000", c6 "1000", c7 "1000"
      And I add the standard of protection before project starts as "very_significant_risk"
      And I add the standard of protection after project completes as "low_risk"
      And I add the standard of protection coastal erosion starts as "one_to_four_years"
      And I add the standard of protection after coastal erosion project completes as "less_that_ten_years"
      And I enter the projects goal approach "A new project with multi funding sources and PFC Vs2020 Calc as PSO"
      And I enter environmental outcomes improvements
      And I complete the natural flood measures task
      And I select the project urgency as "emergency" with a project message of "Because it is an Emergency"
      And I upload a project funding calculator with file option "Yes", "Partnership_funding_calculator_2020_for_FCERM_Grant-in-Aid.xlsx"
      And I select the confidence page
      And I add the confidence in number of homes better protected by this project as "high"
      And I add the confidence in homes being delivered by the projects Gateway 4 date as "low"
      And I add the confidence in securing the required Partnership Funding as "not_applicable"
      And I select the carbon page
      And I add how much capital carbon will this project produce in tonnes "1"
      And I add how much carbon will this project’s assets produce in their lifecycle "2"
     When I submit my proposal
     Then I should see that my proposal is sent for review
