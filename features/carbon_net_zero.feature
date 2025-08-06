@carbon
Feature: Carbon net zero

Background: Sign in and create a new project
    Given I sign in as a "rma" user
      And I create a new proposal
      And I enter a new project name
      And I select a project type "restore asset"
      And I select a financial year to stop spending
      And I select to complete the carbon net zero section
      And I have read the carbon impact guidance

  Scenario: Whole life carbon total is calculated from answers given
     When I add how much capital carbon will this project produce as "1.1"
      And I add how much operational carbon the project will produce as "2.1"
     Then I will be shown the whole life carbon total calculated for the project

  Scenario: Whole life carbon total is calculated with missing operational carbon
     When I add how much capital carbon will this project produce as "1.1"
      And I add how much operational carbon the project will produce as "blank"
     Then I will be shown the whole life carbon total calculated for the project

  Scenario: Whole life carbon total is calculated with missing captial carbon
     When I add how much capital carbon will this project produce as "blank"
      And I add how much operational carbon the project will produce as "7.11"
     Then I will be shown the whole life carbon total calculated for the project

  Scenario: No whole life carbon total is calculated when no values have been input
     When I add how much capital carbon will this project produce as "blank"
      And I add how much operational carbon the project will produce as "blank"
     Then I will not be shown the whole life carbon total calculated for the project

  Scenario: Net carbon cost is calculated from values given
     When I add how much capital carbon will this project produce as "13.1"
      And I add how much operational carbon the project will produce as "2.9"
      And I confirm my whole life carbon total
      And I add how much sequestered carbon the project will store as "7.7"
      And I add how much carbon the project will avoid as "7.7"
      Then I will be shown the net carbon total for the project

  Scenario: Net carbon cost is calculated when no values have been input
     When I add how much capital carbon will this project produce as "blank"
      And I add how much operational carbon the project will produce as "blank"
      And I confirm my whole life carbon total
      And I add how much sequestered carbon the project will store as "blank"
      And I add how much carbon the project will avoid as "blank"
      Then I will not be shown the net carbon total for the project

  Scenario: Full carbon net zero questions answered flow and data display
    When I add how much capital carbon will this project produce as "22.1"
      And I add how much operational carbon the project will produce as "25.9"
      And I confirm my whole life carbon total
      And I add how much sequestered carbon the project will store as "77.7"
      And I add how much carbon the project will avoid as "0.9"
      And I confirm my net carbon total
      And I confirm how much net economic benefit is generated from any net carbon savings as "10000"

  Scenario: Full carbon net zero questions not answers flow and data display
     When I add how much capital carbon will this project produce as "blank"
      And I add how much operational carbon the project will produce as "blank"
      And I confirm my whole life carbon total
      And I add how much sequestered carbon the project will store as "blank"
      And I add how much carbon the project will avoid as "blank"
      And I confirm my net carbon total
      And I confirm how much net economic benefit is generated from any net carbon savings as "blank"
   
