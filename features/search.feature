@frontoffice @search

Feature: Searching for proposals

Scenario Outline: <user> users can search for proposals from proposals page
    Given I sign in as a "<user>" user
    When I search for a project
    Then I can see the project in the search results

    Examples:
        | user | 
        | rma  | 
        | pso  |
        | area | 