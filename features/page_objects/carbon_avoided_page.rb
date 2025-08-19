class CarbonAvoidedPage < BasePage

  section(:user_bar, UserBarSection, UserBarSection::SELECTOR)

  element(:amount, "#carbon-cost-avoided-step-carbon-cost-avoided-field")

  def submit(args = {})
    amount.set(args[:amount]) if args.key?(:amount)

    submit_button.click
  end

end
