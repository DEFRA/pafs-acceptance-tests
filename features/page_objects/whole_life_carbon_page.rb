class WholeLifeCarbonPage < BasePage

  section(:user_bar, UserBarSection, UserBarSection::SELECTOR)

  element(:whole_life_carbon, "#whole-life-carbon-whole-life-carbon b")

  def submit(_args = {})
    submit_button.click
  end

end
