class KilometersOfComprehensiveRestorationHabitatPage < BasePage

  element(:area_of_habitat, "input[id^='kilometres_of_watercourse']")

  def submit(args = {})
    area_of_habitat.set(args[:area]) if args.key?(:area)

    submit_button.click
  end

end
