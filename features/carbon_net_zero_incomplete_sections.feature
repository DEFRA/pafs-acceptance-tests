@carbon
Feature: Incomplete mandatory sections for carbon net zero

  Background:
    Given I sign in as a "rma" user
    And I create a new "new or improve asset" project
    And I select a financial year to stop spending
    And I am returned to the proposal overview page

  Scenario: Check carbon net zero section is incomplete
    When I choose to complete the carbon impact section
    Then I should informed that I need to complete other sections before I can complete the carbon net zero section
