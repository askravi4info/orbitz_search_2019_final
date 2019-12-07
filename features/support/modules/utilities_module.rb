module UtilitiesModule
  def change_date no_of_days
    ((Time.now) + 60 * 60 * 24 * no_of_days).strftime("%m/%d/%y")
  end

  def verify_the_results_are_same? expected_result, actual_result
    if expected_result.eql? actual_result
      p "PASSED because #{expected_result} is same as #{actual_result}"
    else
      p "Failed because #{expected_result} is NOT same as #{actual_result}"
    end
  end

end