class CarbonImpactGuidancePage < BasePage

  section(:user_bar, UserBarSection, UserBarSection::SELECTOR)

  def submit(_args = {})
    submit_button.click
  end

end
