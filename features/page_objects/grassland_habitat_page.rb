class GrasslandHabitatPage < BasePage

  element(:improve_yes, "#grassland_habitat_created_or_enhanced_step_grassland_true", visible: false)
  element(:improve_no, "#grassland_habitat_created_or_enhanced_step_grassland_false", visible: false)

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
