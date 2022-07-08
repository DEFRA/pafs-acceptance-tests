class HectaresOfHeathlandHabitatPage < BasePage

  element(:area_of_habitat, "#hectares_of_heathland_created_or_enhanced_step_hectares_of_heathland_created_or_enhanced")

  def submit(args = {})
    area_of_habitat.set(args[:area]) if args.key?(:area)

    submit_button.click
  end

end
