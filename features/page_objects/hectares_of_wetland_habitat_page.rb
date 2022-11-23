class HectaresOfWetlandHabitatPage < BasePage

  element(:area_of_habitat, "input[id^='hectares-of-wetland-or-wet-grassland-habitat']")

  def submit(args = {})
    area_of_habitat.set(args[:area]) if args.key?(:area)

    submit_button.click
  end

end
