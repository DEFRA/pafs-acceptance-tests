class CarbonCostBuildPage < BasePage

  section(:user_bar, UserBarSection, UserBarSection::SELECTOR)

  element(:amount, "#carbon-cost-build-step-carbon-cost-build-field")

  def submit(args = {})
    amount.set(args[:amount]) if args.key?(:amount)

    submit_button.click
  end

end
