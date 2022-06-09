class HabitatCreationAmountPage < BasePage

  section(:user_bar, AdminUserBarSection, AdminUserBarSection::SELECTOR)

  element(:amount, "#habitat_creation_amount_step_create_habitat_amount")

  element(:submit_button, "input[name='commit']")

  def submit(args = {})
    amount.set(args[:amount]) if args.key?(:amount)

    submit_button.click
  end

end
