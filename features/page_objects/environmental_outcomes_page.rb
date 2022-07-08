class EnvironmentalOutcomesPage < BasePage

  section(:user_bar, AdminUserBarSection, AdminUserBarSection::SELECTOR)

  element(:improve_yes, "#any_environmental_benefits_step_environmental_benefits_true", visible: false)
  element(:improve_no, "#any_environmental_benefits_step_environmental_benefits_false", visible: false)

  def submit(args = {})
    if args[:improve]
      improve_yes.click
    else
      improve_no.click
    end

    submit_button.click
  end

end
