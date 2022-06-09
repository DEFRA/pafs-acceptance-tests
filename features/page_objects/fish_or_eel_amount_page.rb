class FishOrEelAmountPage < BasePage

  section(:user_bar, AdminUserBarSection, AdminUserBarSection::SELECTOR)

  element(:amount, "#fish_or_eel_amount_step_fish_or_eel_amount")

  element(:submit_button, "input[name='commit']")

  def submit(args = {})
    amount.set(args[:amount]) if args.key?(:amount)

    submit_button.click
  end

end
