class HeathlandHabitatPage < BasePage

  element(:improve_yes, "#heathland_habitat_created_or_enhanced_step_heathland_true", visible: false)
  element(:improve_no, "#heathland_habitat_created_or_enhanced_step_heathland_false", visible: false)

  def submit(args = {})
    case args[:improve]
    when true
      improve_yes.click
    when false
      improve_no.click
    end

    submit_button.click
  end

end
