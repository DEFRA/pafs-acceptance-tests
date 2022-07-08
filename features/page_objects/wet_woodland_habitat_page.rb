class WetWoodlandHabitatPage < BasePage

  element(:improve_yes, "#wet_woodland_habitat_created_or_enhanced_step_wet_woodland_true", visible: false)
  element(:improve_no, "#wet_woodland_habitat_created_or_enhanced_step_wet_woodland_false", visible: false)

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
