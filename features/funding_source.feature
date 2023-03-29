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
     When I enter funding sources "growth_funding"
     And I enter FCRM grant in aid funding sources "asset_replacement environment_statutory frequently_flooded_communities other_gia other_gov summer_economic"