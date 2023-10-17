class BenefitAreaFileSummaryPage < BasePage

  section(:user_bar, UserBarSection, UserBarSection::SELECTOR)

  element(:delete_file, "a[href$='delete_benefit_area']")

  def submit(_args = {})
    submit_button.click
  end

end
