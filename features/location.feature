@location
Feature: Location of proposal

Scenario: Create a new proposal with a valid shapefile
    Given I sign in as a "rma" user
    And I create a new "new or improve asset" project
    And I select a financial year to stop spending
    And I add a location "ST 58198 72725"
   When I upload the benefit area file "Valid_ShapeFile.zip"
   Then I should see the message "The uploaded shapefile" on the benefit area page

  Scenario Outline: Submit a new proposal with an invalid shapefile
    Given I sign in as a "rma" user
    And I create a new "new or improve asset" project
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
    And I create a new "new or improve asset" project
    And I select a financial year to stop spending
    And I add a location "ST 58198 72725"
    And I click and continue
   Then I should see the message "Upload a shapefile that outlines the area the project is likely to benefit" on the benefit file page

  Scenario Outline: Submit a new proposal with invalid shapefile
    Given I sign in as a "rma" user
    And I create a new "new or improve asset" project
    And I select a financial year to stop spending
    And I add a location "ST 58198 72725"
   When I upload the benefit area file "<ShapeFile>"
   Then I should see the message "<Message>" on the benefit file page

    Examples:
    |ShapeFile            |Message                                                                                            |
    |Invalid_ShapeFile.zip|The selected file must be a zip file, containing the following mandatory files: dbf. shx. shp. prj.|