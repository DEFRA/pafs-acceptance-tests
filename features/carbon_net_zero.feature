@carbon
Feature: Carbon net zero

Background: Sign in and create a new project
    Given I sign in as a "rma" user
      And I create a new proposal
      And I enter a new project name
      And I select a project type "restore asset"
      And I select a financial year to stop spending as "2029"
      And I answer the earliest start date as after next year
      And I enter the ready for service date as "2029"
      And I enter funding sources "internal_drainage_boards"
      And I enter funding values of 1000000
      And I choose to complete the carbon impact section
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
     Then I will be shown the whole life carbon total calculated for the project

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
      Then I will be shown the net carbon total for the project

  Scenario: Full carbon net zero questions answered flow and data display
    When I add how much capital carbon will this project produce as "22.1"
      And I add how much operational carbon the project will produce as "25.9"
      And I confirm my whole life carbon total
      And I add how much sequestered carbon the project will store as "77.7"
      And I add how much carbon the project will avoid as "0.9"
      And I confirm my net carbon total
      And I confirm how much net economic benefit is generated from any net carbon savings as "10000"
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
      And I will see the calculated capital carbon baseline as "314.00"
      And I will see the calculated capital carbon target as "172.70"
      And I will see the operational carbon estimated for the project
      And I will see the calculated operational carbon baseline as "391.00"
      And I will see the calculated operational carbon target as "215.05"
      And I will see the net carbon estimated for the project
      And I will see all the carbon net zero summarised on the project summary page

  Scenario: Full carbon net zero questions not answered flow and data display
     When I add how much capital carbon will this project produce as "blank"
      And I add how much operational carbon the project will produce as "blank"
      And I confirm my whole life carbon total
      And I add how much sequestered carbon the project will store as "blank"
      And I add how much carbon the project will avoid as "blank"
      And I confirm my net carbon total
      And I confirm how much net economic benefit is generated from any net carbon savings as "blank"
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
      And I will see the calculated capital carbon baseline as "314.00"
      And I will see the calculated capital carbon target as "172.70"
      And I will see the operational carbon estimated for the project
      And I will see the calculated operational carbon baseline as "391.00"
      And I will see the calculated operational carbon target as "215.05"
      And I will see the net carbon with blank values calculated estimated for the project
      And I will see all the carbon net zero summarised on the project summary page
   
