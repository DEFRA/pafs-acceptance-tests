class HectaresOfWetlandHabitatPage < BasePage

  element(:area_of_habitat, "input[id^='hectares_of_wetland_or_wet_grassland']")

  def submit(args = {})
    area_of_habitat.set(args[:area]) if args.key?(:area)

    submit_button.click
  end

end
