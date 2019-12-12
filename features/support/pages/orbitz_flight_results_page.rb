class OrbitzFlightResultsPage
  require_relative '../modules/utilities_module'

  include PageObject
  include UtilitiesModule

  div(:results_title, class: 'title-departure')
  spans(:all_flight_prices, :class => 'full-bold no-wrap')


  def get_all_flight_prices
    # sleep 5
    new_arr = []
    all_flight_prices_elements.each do |each_price|
      new_arr << each_price.text.gsub('$', '').gsub(',', '').to_f
    end
    new_arr
  end

end