class ArableHabitatPage < BasePage

  element(:improve_yes, "#arable-land-created-or-enhanced-step-arable-land-true-field", visible: false)
  element(:improve_no, "#arable-land-created-or-enhanced-step-arable-land-false-field", visible: false)

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
