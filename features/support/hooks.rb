require 'watir'

Before do |scenario|
  DataMagic.load_for_scenario(scenario)
  @browser = Watir::Browser.new :chrome
end

After do
  @browser.close
end

After do |scenario|
  if scenario.failed?
    @browser.driver.save_screenshot 'failed_test.png'
  end
end