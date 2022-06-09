class CarbonCostBuild < BasePage

  section(:user_bar, AdminUserBarSection, AdminUserBarSection::SELECTOR)

  element(:amount, "#carbon_cost_build_step_carbon_cost_build")

  element(:submit_button, "input[name='commit']")

  def submit(args = {})
    amount.set(args[:amount]) if args.key?(:amount)

    submit_button.click
  end

end
