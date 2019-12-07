class OrbitzFlightResultsPage
  require_relative '../modules/utilities_module'

  include PageObject
  include UtilitiesModule

  div(:results_title, class: 'title-departure')

end