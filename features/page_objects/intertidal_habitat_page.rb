class IntertidalHabitatPage < BasePage

  element(:improve_yes, "#intertidal-habitat-created-or-enhanced-step-intertidal-habitat-true-field", visible: false)
  element(:improve_no, "#intertidal-habitat-created-or-enhanced-step-intertidal-habitat-false-field", visible: false)

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
