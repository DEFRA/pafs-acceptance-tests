class EnvironmentalOutcomesPage < BasePage

  section(:user_bar, AdminUserBarSection, AdminUserBarSection::SELECTOR)

  element(:improve_yes, "#surface_and_groundwater_step_improve_surface_or_groundwater_true", visible: false)
  element(:improve_no, "#surface_and_groundwater_step_improve_surface_or_groundwater_false", visible: false)

  element(:submit_button, "input[name='commit']")

  def submit(args = {})
    if args[:improve]
      improve_yes.click
    else
      improve_no.click
    end

    submit_button.click
  end

end
