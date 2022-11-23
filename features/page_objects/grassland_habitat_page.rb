class GrasslandHabitatPage < BasePage

  element(:improve_yes, "#grassland-habitat-created-or-enhanced-step-grassland-true-field", visible: false)
  element(:improve_no, "#grassland-habitat-created-or-enhanced-step-grassland-false-field", visible: false)

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
