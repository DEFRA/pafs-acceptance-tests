class ImproveRiverPage < BasePage

  section(:user_bar, AdminUserBarSection, AdminUserBarSection::SELECTOR)

  element(:improve_yes, "#improve_river_step_improve_river_true", visible: false)
  element(:improve_no, "#improve_river_step_improve_river_false", visible: false)

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
