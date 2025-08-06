class CarbonNetTotalPage < BasePage

  section(:user_bar, UserBarSection, UserBarSection::SELECTOR)

  element(:net_carbon, "#net-carbon-net-carbon b")

  def submit(_args = {})
    submit_button.click
  end

end
