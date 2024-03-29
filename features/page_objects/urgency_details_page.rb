class UrgencyDetailsPage < BasePage

  section(:user_bar, UserBarSection, UserBarSection::SELECTOR)

  element(:details, "#urgency-details-step-urgency-details-field")

  def submit(args = {})
    details.set(args[:details]) if args.key?(:details)

    submit_button.click
  end

end
