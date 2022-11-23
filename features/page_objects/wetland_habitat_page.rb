class WetlandHabitatPage < BasePage

  element(:improve_yes, "input[id$='wetland-or-wet-grassland-true-field']", visible: false)
  element(:improve_no, "input[id$='wetland-or-wet-grassland-false-field']", visible: false)

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
