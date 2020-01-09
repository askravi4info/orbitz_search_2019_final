require 'watir'

Before do |scenario|
  DataMagic.load_for_scenario(scenario)
  @browser = Watir::Browser.new :chrome
end

After do
  @browser.close
end

After do |scenario|
  SCREENSHOTS_DIRECTORY = "report_results"
  if scenario.failed?
    #Saves screenshots to features/test_results/Screenshots directory, name is scenario name + timestamp
    unique_time = Time.now.strftime("%m_%d_%m_%s")
    screenshot = "#{scenario.name.gsub(' ', '_').gsub(/[^0-9A-Za-z_]/, '')}_#{unique_time}.png"
    @browser.driver.save_screenshot(File.join(SCREENSHOTS_DIRECTORY, screenshot))
    embed(File.join(SCREENSHOTS_DIRECTORY, screenshot), "image/png", "SCREENSHOT")
  end
end
