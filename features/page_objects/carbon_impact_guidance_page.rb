class CarbonImpactGuidancePage < BasePage

  section(:user_bar, UserBarSection, UserBarSection::SELECTOR)

  def submit(args = {})

    submit_button.click
  end

end
