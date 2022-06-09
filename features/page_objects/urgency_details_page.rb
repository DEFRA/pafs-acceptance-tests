class UrgencyDetailsPage < BasePage

  section(:user_bar, AdminUserBarSection, AdminUserBarSection::SELECTOR)

  element(:details, "#urgency_details_step_urgency_details")

  element(:submit_button, "input[name='commit']")

  def submit(args = {})
    details.set(args[:details]) if args.key?(:details)

    submit_button.click
  end

end
