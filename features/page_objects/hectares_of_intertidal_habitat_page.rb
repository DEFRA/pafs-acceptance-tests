class HectaresOfIntertidalHabitatPage < BasePage

  element(:area_of_habitat, "input[id^='hectares-of-intertidal-habitat']")

  def submit(args = {})
    area_of_habitat.set(args[:area]) if args.key?(:area)

    submit_button.click
  end

end
