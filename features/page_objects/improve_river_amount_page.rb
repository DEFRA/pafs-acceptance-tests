class ImproveRiverAmountPage < BasePage

  section(:user_bar, AdminUserBarSection, AdminUserBarSection::SELECTOR)

  element(:amount, "#improve_river_amount_step_improve_river_amount")

  element(:submit_button, "input[name='commit']")

  def submit(args = {})
    amount.set(args[:amount]) if args.key?(:amount)

    submit_button.click
  end

end
