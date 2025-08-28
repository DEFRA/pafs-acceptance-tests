class OperationalAndMaintenanceCostPage < BasePage

  section(:user_bar, UserBarSection, UserBarSection::SELECTOR)
  # TODO: Update selector
  element(:amount, "#carbon-operational-cost-forecast-step-carbon-operational-cost-forecast-field")

  def submit(args = {})
    amount.set(args[:amount]) if args.key?(:amount)

    submit_button.click
  end

end
