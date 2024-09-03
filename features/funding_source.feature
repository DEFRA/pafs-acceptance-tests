@funding
Feature: Funding sources

Scenario: Funding sources without Additional FCRM Grant-in-Aid can be added to a proposal
    Given I sign in as a "rma" user
      And I create a new "restore asset" project
      And I select a financial year to stop spending
     When I enter funding sources "grant_in_aid local_levy public_sector private_sector other_sector internal_drainage_boards not_identified"
      And I enter funding source contributors and values
     Then I can see the funding sources and values in the proposal overview
   
Scenario: Final spending year past 2028 can be entered and shown in the funding sources table
    Given I sign in as a "rma" user
      And I create a new "benefits households" project
     When I select a financial year to stop spending as "2030"
      And I enter funding sources "internal_drainage_boards not_identified"
     Then I can see the last financial year to stop spending is the last year in the funding table

Scenario: Additional FCRM Grant in aid funding sources can be added to a proposal
    Given I sign in as a "rma" user
      And I create a new "restore asset" project
      And I select a financial year to stop spending
     When I enter funding sources "fcrm_gia"
      And I enter FCRM grant in aid funding sources "asset_replacement environment_statutory frequently_flooded_communities other_gia other_gov summer_economic recovery"
      And I enter funding source contributors and values
     Then I can see the funding sources and values in the proposal overview

  Scenario: All funding sources can be added to a proposal
    Given I sign in as a "rma" user
      And I create a new "restore asset" project
      And I select a financial year to stop spending
     When I enter funding sources "grant_in_aid local_levy public_sector private_sector other_sector internal_drainage_boards not_identified fcrm_gia"
      And I enter FCRM grant in aid funding sources "asset_replacement environment_statutory frequently_flooded_communities other_gia other_gov summer_economic recovery"
      And I enter funding source contributors and values
     Then I can see the funding sources and values in the proposal overview


Scenario: Additional FCRM Grant in aid funding sources can be added to a proposal
    Given I sign in as a "rma" user
      And I create a new "restore asset" project
      And I select a financial year to stop spending
     When I enter funding sources "fcrm_gia"
      And I enter FCRM grant in aid funding sources "asset_replacement environment_statutory frequently_flooded_communities other_gia other_gov summer_economic recovery"
      And I enter funding source contributors and values
     Then I can see the funding sources and values in the proposal overview

  Scenario: All funding sources can be added to a proposal
    Given I sign in as a "rma" user
      And I create a new "restore asset" project
      And I select a financial year to stop spending
     When I enter funding sources "grant_in_aid local_levy public_sector private_sector other_sector internal_drainage_boards not_identified fcrm_gia"
      And I enter FCRM grant in aid funding sources "asset_replacement environment_statutory frequently_flooded_communities other_gia other_gov summer_economic recovery"
      And I enter funding source contributors and values
     Then I can see the funding sources and values in the proposal overview


  Scenario: Submission validation when funding source data is entered outside of date range of project
    Given I sign in as a "rma" user
      And I create a new proposal
      And I enter a new project name
      And I select a project type "restore asset"
      And I select a financial year to stop spending as "2030"
      And I answer the earliest start date as after next year
      And I enter the ready for service date as "2029"
      When I enter funding sources "grant_in_aid"
      And I enter grant_in_aid funds for the first available year
      And I submit my proposal
     Then I should be informed "You cannot submit your project proposal, because the funding data entered is outside the date range for your project."
