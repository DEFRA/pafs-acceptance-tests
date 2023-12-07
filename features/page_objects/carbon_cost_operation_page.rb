class CarbonCostOperationPage < BasePage

  section(:user_bar, UserBarSection, UserBarSection::SELECTOR)

  element(:amount, "#carbon-cost-operation-step-carbon-cost-operation-field")

  def submit(args = {})
    amount.set(args[:amount]) if args.key?(:amount)

    submit_button.click
  end

end
