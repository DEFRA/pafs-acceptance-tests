class CarbonSequesteredPage < BasePage

  section(:user_bar, UserBarSection, UserBarSection::SELECTOR)

  element(:amount, "#carbon-cost-sequestered-step-carbon-cost-sequestered-field")

  def submit(args = {})
    amount.set(args[:amount]) if args.key?(:amount)

    submit_button.click
  end

end
