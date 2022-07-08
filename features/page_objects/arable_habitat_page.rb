class ArableHabitatPage < BasePage

  element(:improve_yes, "#arable_land_created_or_enhanced_step_arable_land_true", visible: false)
  element(:improve_no, "#arable_land_created_or_enhanced_step_arable_land_false", visible: false)

  def submit(args = {})
    if args[:improve]
      improve_yes.click
    else
      improve_no.click
    end

    submit_button.click
  end

end
