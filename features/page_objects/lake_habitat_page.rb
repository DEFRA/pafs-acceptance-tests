class LakeHabitatPage < BasePage

  element(:improve_yes, "#ponds_lakes_habitat_created_or_enhanced_step_ponds_lakes_true", visible: false)
  element(:improve_no, "#ponds_lakes_habitat_created_or_enhanced_step_ponds_lakes_false", visible: false)

  def submit(args = {})
    if args[:improve]
      improve_yes.click
    else
      improve_no.click
    end

    submit_button.click
  end

end
