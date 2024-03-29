class MainRiskPage < BasePage

  section(:user_bar, UserBarSection, UserBarSection::SELECTOR)

  elements(:source, "input[type='radio']", visible: false)

  def submit(_args = {})
    source.first.click
    submit_button.click
  end

end
