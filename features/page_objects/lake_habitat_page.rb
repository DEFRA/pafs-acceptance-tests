class LakeHabitatPage < BasePage

  element(:improve_yes, "#ponds-lakes-habitat-created-or-enhanced-step-ponds-lakes-true-field", visible: false)
  element(:improve_no, "#ponds-lakes-habitat-created-or-enhanced-step-ponds-lakes-false-field", visible: false)

  def submit(args = {})
    if args[:improve]
      improve_yes.click
    else
      improve_no.click
    end

    submit_button.click
  end

end
