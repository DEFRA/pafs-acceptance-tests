class IntertidalHabitatPage < BasePage

  element(:improve_yes, "#intertidal_habitat_created_or_enhanced_step_intertidal_habitat_true", visible: false)
  element(:improve_no, "#intertidal_habitat_created_or_enhanced_step_intertidal_habitat_false", visible: false)

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
