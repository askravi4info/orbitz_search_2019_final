class OrbitzFlightResultsPage
  require_relative '../modules/utilities_module'

  include PageObject
  include UtilitiesModule

  div(:results_title, class: 'title-departure')
  spans(:all_flight_prices, :class => 'full-bold no-wrap')
  div(:filter_section, class: 'check filter-option')
  fieldset(:all_airlines_check_boxes, id: 'airlines')

  def wait_until_all_flight_results_loaded
    p "Starting Time - #{Time.now}"
    on(OrbitzFlightResultsPage).wait_until(30) do
      on(OrbitzFlightResultsPage).filter_section_element.text.match /\d\d \d Stops/
      p "Ending Time - #{Time.now}"
    end
  end


  def get_all_flight_prices
    # sleep 5
    wait_until_all_flight_results_loaded
    new_arr = []
    all_flight_prices_elements.each do |each_price|
      new_arr << each_price.text.gsub('$', '').gsub(',', '').to_f
    end
    new_arr
  end

  def select_first_airline_filter
    all_airlines_check_boxes_element.divs(class: 'uitk-grid all-grid-fallback-alt')[0].checkbox.click
  end

  def get_first_airline_filter_details
    first_flight_details = all_airlines_check_boxes_element.divs(class: 'uitk-grid all-grid-fallback-alt')[0].span.text
    no_of_available_flights = first_flight_details[0, 2].to_i
    name_of_the_first_airline = first_flight_details.gsub(/flights.*/, '').gsub(/\d*/, '').strip
    return no_of_available_flights, name_of_the_first_airline
  end

  def get_all_flight_names
    all_flight_names = []
    @browser.ul(id: 'flightModuleList').lis(class: 'flight-module segment offer-listing').each do |each_flight_result|
      all_flight_names << each_flight_result.div(class: 'secondary-content overflow-ellipsis inline-children').span.innertext
    end
    all_flight_names
  end

  def get_no_of_flights
    @browser.ul(id: 'flightModuleList').lis(class: 'flight-module segment offer-listing').count
  end

end