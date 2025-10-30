@carbon
Feature: Carbon net zero future years outside of carbon impact calculations
  In order to ensure that future years outside of the carbon impact calculations are handled correctly the nearest previous year is used in calculations

Background: Sign in and create a new project with an end year outside of carbon impact calculations
    Given I sign in as a "rma" user
      And I create a new proposal
      And I enter a new project name
      And I select a project type "restore asset"
      And I select a financial year to stop spending as "2040"
      And I answer the earliest start date as "2039"
      And I enter the ready for service date as "2040"
      And I enter funding sources "internal_drainage_boards"
      And I enter funding values of 1000000
      And I choose to complete the carbon impact section
      And I have read the carbon impact guidance

    Scenario: Carbon summary and calculations display correctly when project end year is outside of carbon impact calculation data
     When I add how much capital carbon will this project produce as "50"
      And I add how much operational carbon the project will produce as "30"
      And I confirm my whole life carbon total
      And I add how much sequestered carbon the project will store as "43"
      And I add how much carbon the project will avoid as "9.99"
      And I confirm my net carbon total
      And I confirm how much net economic benefit is generated from any net carbon savings as "50000"
      And I confirm how much operation and maintenance cost is forecast for the project as "1000000"
     Then I will see a summary of the project's capital carbon
      And I will see a summary of the project's operational carbon
      And I will see a summary of the project's whole life carbon
      And I will see a summary of the project's sequestered carbon
      And I will see a summary of the project's avoided carbon
      And I will see a summary of the project's net carbon
      And I will see a summary of the project's economic benefit from carbon savings
      And I will see a summary of the estimated capital cost for the project
      And I will see a summary of the project's estimated operation and maintenance cost
      When I select to view the carbon impact calculations
      Then I will see the capital carbon estimated for the project
      And I will see the calculated capital carbon baseline as "317.00"
      And I will see the calculated capital carbon target as "131.56"
      And I will see the operational carbon estimated for the project
      And I will see the calculated operational carbon baseline as "391.00"
      And I will see the calculated operational carbon target as "162.27"
      And I will see the net carbon estimated for the project