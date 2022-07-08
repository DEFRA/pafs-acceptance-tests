class IntertidalHabitatPage < BasePage

  element(:improve_yes, "#intertidal_habitat_created_or_enhanced_step_intertidal_habitat_true", visible: false)
  element(:improve_no, "#intertidal_habitat_created_or_enhanced_step_intertidal_habitat_false", visible: false)

  def submit(args = {})
    if args[:improve]
      improve_yes.click
    else
      improve_no.click
    end

    submit_button.click
  end

end
