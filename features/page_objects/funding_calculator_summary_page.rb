class FundingCalculatorSummaryPage < BasePage

  section(:user_bar, AdminUserBarSection, AdminUserBarSection::SELECTOR)

  element(:delete_file, "a[href$='delete_funding_calculator']")

  element(:submit_button, "input[name='commit']")

  def submit(_args = {})
    submit_button.click
  end

end
