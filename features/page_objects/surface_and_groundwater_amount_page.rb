class SurfaceAndGroundwaterAmountPage < BasePage

  section(:user_bar, AdminUserBarSection, AdminUserBarSection::SELECTOR)

  element(:length, "#surface_and_groundwater_amount_step_improve_surface_or_groundwater_amount")

  element(:submit_button, "input[name='commit']")

  def submit(args = {})
    length.set(args[:length]) if args.key?(:length)

    submit_button.click
  end

end
