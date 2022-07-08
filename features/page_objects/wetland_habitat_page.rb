class WetlandHabitatPage < BasePage

  element(:improve_yes, "input[id$='wet_grassland_true']", visible: false)
  element(:improve_no, "input[id$='wet_grassland_false']", visible: false)

  def submit(args = {})
    if args[:improve]
      improve_yes.click
    else
      improve_no.click
    end

    submit_button.click
  end

end
