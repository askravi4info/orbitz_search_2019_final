# 1) Imperative positive search scenario
Feature: Orbitz Flight Search

  Background:
    Given The user is on the Orbitz home page
@database
  Scenario: Verify the user is able to search for the flights with the future dates
    When The user clicks on the Flights tab
    And User selects the Round-trip option
    And User enters the columbus city in the Flying from text box and selects the CMHS airport
    And User enters the cleveland city in the Flying to text box and selects the CLE airport
    And User enters the future date in the departing date field
    And User enters the future date in the returning date field
    And User clicks on the search button
    Then User gets the list of all available flights for the given date and airport

#    Declarative style
  Scenario: verify the user is able to search for the available flights for future date
    When user search for the future flights
    Then User gets the list of all available flights for the given date and airport


#2) Imperative Positive Flight Search Scenario Outline
  Scenario Outline: Verify the user is able to search for the flights with the future dates and different cities
    When The user clicks on the Flights tab
    And User selects the Round-trip option
    And User enters the <departure_city> city in the Flying from text box and selects the <dep_airport_code> airport
    And User enters the <arrival_city> city in the Flying to text box and selects the <arr_airport_code> airport
    And User enters the future date in the departing date field
    And User enters the future date in the returning date field
    And User clicks on the search button
    Then User gets the list of all available flights for the given date and airport
    Examples:
      | departure_city | dep_airport_code | arrival_city | arr_airport_code |
      | columbus       | CMH              | cleveland    | CLE              |
      | columbus       | CMH              | chicago      | ORD              |
      | chicago        | ORD              | washington   | IAD              |


#3) Imperative Negative Flight Search Scenario - Error message
  Scenario: Verify the user is warned when searching for the flights with past dates
    When The user clicks on the Flights tab
    And User selects the Round-trip option
    And User enters the columbus city in the Flying from text box and selects the CMH airport
    And User enters the cleveland city in the Flying to text box and selects the CLE airport
    And User enters the past date in the departing date field
    And User enters the past date in the returning date field
    And User clicks on the search button
    Then User gets the error message

#4) Declarative Negative Flight Search - Error message
  Scenario: Verify the user is warned when searching for the flights with past dates
    When User clicks on the round trip option in the Flights tab
    And User enters all the required information with past date in the Departing field
    And User clicks on the search button
    Then User should be warned with an error message

#5) Declarative Flight Search Scenario - using Inline table format
  Scenario: Verify the user is able to search for the flights with future dates
    When User clicks on the round trip option in the Flights tab
    And User enters all the required information
      | columbus CMH  |
      | cleveland CLE |
      | 11/17/2019    |
      | 11/20/2019    |
    And User clicks on the Search button
    Then All the available flights should be displayed

Scenario: testing yml files
  When I read the yml file, I should see the data

