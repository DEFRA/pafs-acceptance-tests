class HectaresOfHeathlandHabitatPage < BasePage

  element(:area_of_habitat,
          "#hectares-of-heathland-created-or-enhanced-step-hectares-of-heathland-created-or-enhanced-field")

  def submit(args = {})
    area_of_habitat.set(args[:area]) if args.key?(:area)

    submit_button.click
  end

end
