class HeathlandHabitatPage < BasePage

  element(:improve_yes, "#heathland-habitat-created-or-enhanced-step-heathland-true-field", visible: false)
  element(:improve_no, "#heathland-habitat-created-or-enhanced-step-heathland-false-field", visible: false)

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
