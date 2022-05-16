class LocationPage < BasePage

  section(:user_bar, AdminUserBarSection, AdminUserBarSection::SELECTOR)

  element(:location, "#location_step_grid_reference")
  element(:submit_button, "input[name='commit']")

  def submit(args = {})
    location.set(args[:location]) if args.key?(:location)
    submit_button.click
  end

end
