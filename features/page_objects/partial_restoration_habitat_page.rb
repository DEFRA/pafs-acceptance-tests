class PartialRestorationHabitatPage < BasePage

  element(:improve_yes, "#partial-restoration-step-partial-restoration-true-field", visible: false)
  element(:improve_no, "#partial-restoration-step-partial-restoration-false-field", visible: false)

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
