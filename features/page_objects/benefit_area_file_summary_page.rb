class BenefitAreaFileSummaryPage < BasePage

  section(:user_bar, AdminUserBarSection, AdminUserBarSection::SELECTOR)

  element(:delete_file, "a[href$='delete_benefit_area']")

  element(:submit_button, "input[name='commit']")

  def submit(_args = {})
    submit_button.click
  end

end
