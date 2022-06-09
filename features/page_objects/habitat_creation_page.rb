class HabitatCreationPage < BasePage

  section(:user_bar, AdminUserBarSection, AdminUserBarSection::SELECTOR)

  element(:create_yes, "#habitat_creation_step_create_habitat_true", visible: false)
  element(:create_no, "#habitat_creation_step_create_habitat_false", visible: false)

  element(:submit_button, "input[name='commit']")

  def submit(args = {})
    if args[:create]
      create_yes.click
    else
      create_no.click
    end

    submit_button.click
  end

end
