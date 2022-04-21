@frontoffice
Feature: Create a new project application for Smoke Tests
  As a council
  I want to submit a proposal for flood and coastal erosion risk management project funding
  So that my local area can have improved protection from flooding

  @QA_SecurityTests @Train_SecurityTests @PreProd_SecurityTests @ST1
  Scenario Outline: Submit a new proposal with an pseudo-virus shapefile
  Given I am an external user
    And I select "accept" for Pafs to store cookies on my device
    And I have a valid "rma" username and password
    And I create a new proposal
    And I enter a new project name
    And I select a project type "change_or_new_asset"
    And I select a financial year to stop spending
    And I add a location "ST 58198 72725"
   When I upload the benefit area file "<ShapeFile>"
   Then I should see the message "<Message>" on the benefit file page

    Examples:
    |ShapeFile|Message|
    |Virus_ShapeFile.zip|The file was rejected because it may contain a virus. Check the file and try again|
