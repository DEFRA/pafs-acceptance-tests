class WoodlandHabitatPage < BasePage

  element(:improve_yes, "#woodland-habitat-created-or-enhanced-step-woodland-true-field", visible: false)
  element(:improve_no, "#woodland-habitat-created-or-enhanced-step-woodland-false-field", visible: false)

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
