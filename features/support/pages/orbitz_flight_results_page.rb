class OrbitzFlightResultsPage
  require_relative '../modules/utilities_module'

  include PageObject
  include UtilitiesModule

  div(:results_title, class: 'title-departure')
  spans(:all_flight_prices, :class => 'full-bold no-wrap')
  div(:filter_section, class: 'check filter-option')

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

end