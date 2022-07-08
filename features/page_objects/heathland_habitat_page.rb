class HeathlandHabitatPage < BasePage

  element(:improve_yes, "#heathland_habitat_created_or_enhanced_step_heathland_true", visible: false)
  element(:improve_no, "#heathland_habitat_created_or_enhanced_step_heathland_false", visible: false)

  def submit(args = {})
    if args[:improve]
      improve_yes.click
    else
      improve_no.click
    end

    submit_button.click
  end

end
