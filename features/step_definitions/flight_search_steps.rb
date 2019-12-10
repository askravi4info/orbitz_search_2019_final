Given(/^The user is on the Orbitz home page$/) do
  visit OrbitzHomePage
end

When(/^The user clicks on the Flights tab$/) do
  on(OrbitzHomePage).select_flight_tab_element.click
end

And(/^User selects the Round\-trip option$/) do
  on(OrbitzHomePage).choose_round_trip_element.click
end

And(/^User enters the (.*) city in the Flying from text box and selects the (.*) airport$/) do |city_name, airport_name|
  on(OrbitzHomePage).set_dep_airport city_name, airport_name
end

And(/^User enters the (.*) city in the Flying to text box and selects the (.*) airport$/) do |city_name, airport_name|
  on(OrbitzHomePage).set_arr_airport city_name, airport_name
end

And(/^User enters the (future|past) date in the (departing|returning) date field$/) do |future_past, dep_arr|
  on(OrbitzHomePage).set_dates_for dep_arr, future_past
end

And(/^User clicks on the search button$/) do
  on(OrbitzHomePage).search_for_flights_element.click
end

Then(/^User gets the list of all available flights for the given date and airport$/) do
  expected_result_message = 'aaaaa Select your departure to'
  actual_result_message = on(OrbitzFlightResultsPage).results_title_element.text
  # on(OrbitzFlightResultsPage).verify_the_results_are_same? expected_result_message, actual_result_message
  # fail "Expected message - #{expected_result_message} is NOT in the Actual message - #{actual_result_message} " unless actual_result_message.include? expected_result_message
  # fail "Expected message - #{expected_result_message} is NOT in the Actual message - #{actual_result_message} " if !actual_result_message.include? expected_result_message
  expect(actual_result_message).should include expected_result_message
end

When(/^user search for the future flights$/) do
  # on(OrbitzHomePage) do |page|
  #   page.select_flight_tab_element.click
  #   page.choose_round_trip_element.click
  #   page.set_dep_airport 'columbus', 'CMH'
  #   page.set_arr_airport 'cleveland', 'CLE'
  #   page.set_dates_for 'departing', 'future'
  #   page.set_dates_for 'returning', 'future'
  #   page.search_for_flights_element.click
  # end

  step 'When The user clicks on the Flights tab'
  step 'User selects the Round-trip option'

end

When(/^I read the yml file, I should see the data$/) do
  @test_info = YAML.load_file 'features/support/test_data.yml'
  p @test_info.fetch 'name'
  p @test_info['qa']['company']
  p 'done'
end