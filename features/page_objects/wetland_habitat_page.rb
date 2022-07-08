class WetlandHabitatPage < BasePage

  element(:improve_yes, "input[id$='wet_grassland_true']", visible: false)
  element(:improve_no, "input[id$='wet_grassland_false']", visible: false)

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
