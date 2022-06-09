class FundingCalculatorSummaryPage < BasePage

  section(:user_bar, AdminUserBarSection, AdminUserBarSection::SELECTOR)

  element(:uploaded_file, "td:nth-child(1) a[aria-describedby='file-context']")
  element(:delete_file, "a[href$='delete_funding_calculator']")

  element(:submit_button, "input[name='commit']")

  def submit(_args = {})
    submit_button.click
  end

end
