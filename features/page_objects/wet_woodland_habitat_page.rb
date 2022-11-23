class WetWoodlandHabitatPage < BasePage

  element(:improve_yes, "#wet-woodland-habitat-created-or-enhanced-step-wet-woodland-true-field", visible: false)
  element(:improve_no, "#wet-woodland-habitat-created-or-enhanced-step-wet-woodland-false-field", visible: false)

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
