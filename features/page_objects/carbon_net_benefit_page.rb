class CarbonNetBenefitPage < BasePage

  section(:user_bar, UserBarSection, UserBarSection::SELECTOR)

  element(:amount, "#net-carbon-benefit-step-carbon-savings-net-economic-benefit-field")

  def submit(args = {})
    amount.set(args[:amount]) if args.key?(:amount)

    submit_button.click
  end

end
