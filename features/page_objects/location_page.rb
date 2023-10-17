class LocationPage < BasePage

  section(:user_bar, UserBarSection, UserBarSection::SELECTOR)

  element(:location, "#location-step-grid-reference-field")

  def submit(args = {})
    location.set(args[:location]) if args.key?(:location)
    submit_button.click
  end

end
