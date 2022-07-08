class GrasslandHabitatPage < BasePage

  element(:improve_yes, "#grassland_habitat_created_or_enhanced_step_grassland_true", visible: false)
  element(:improve_no, "#grassland_habitat_created_or_enhanced_step_grassland_false", visible: false)

  def submit(args = {})
    if args[:improve]
      improve_yes.click
    else
      improve_no.click
    end

    submit_button.click
  end

end
