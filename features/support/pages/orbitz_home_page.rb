class OrbitzHomePage

  require_relative '../modules/utilities_module'

  include PageObject
  include UtilitiesModule

  page_url 'www.orbitz.com'

  button(:select_flight_tab, id: 'tab-flight-tab-hp')
  label(:choose_round_trip, id: 'flight-type-roundtrip-label-hp-flight')
  text_field(:set_departure_city, id: 'flight-origin-hp-flight')
  text_field(:set_arrival_city, id: 'flight-destination-hp-flight')
  ul(:all_airports, id: 'typeaheadDataPlain')
  text_field(:set_dep_date, id: 'flight-departing-hp-flight')
  text_field(:set_arr_date, id: 'flight-returning-hp-flight')
  button(:search_for_flights, class: 'btn-primary btn-action gcw-submit')


  def select_airport airport_name
    # @browser.ul(id: 'typeaheadDataPlain').lis.each do |each_airport|
    all_airports_element.lis.each do |each_airport|
      p each_airport.text
      if each_airport.text.upcase.include? airport_name
        each_airport.click
        break
      end
    end
  end

  def set_dep_airport city_name, airport_name
    # @browser.text_field(id: 'flight-origin-hp-flight').set city_name
    # set_departure_city_element.set city_name
    self.set_departure_city = city_name
    sleep 1
    select_airport airport_name
  end

  def set_arr_airport city_name, airport_name
    # @browser.text_field(id: 'flight-destination-hp-flight').set city_name
    # set_arrival_city_element.set city_name
    self.set_arrival_city = city_name
    sleep 1
    select_airport airport_name
  end

  def set_dates_for dep_arr, past_future
    if past_future == 'future'
      past_future = 2
    else
      past_future = -2
    end

    if dep_arr == 'departing'
      self.set_dep_date = change_date past_future
    elsif dep_arr == 'returning'
      self.set_arr_date = change_date past_future
    end
  end



end