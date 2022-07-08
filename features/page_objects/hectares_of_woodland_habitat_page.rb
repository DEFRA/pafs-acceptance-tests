class HectaresOfWoodlandHabitatPage < BasePage

  element(:area_of_habitat, "input[id^='hectares_of_woodland_habitat']")

  def submit(args = {})
    area_of_habitat.set(args[:area]) if args.key?(:area)

    submit_button.click
  end

end
