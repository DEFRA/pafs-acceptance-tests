class ComprehensiveRestorationHabitatPage < BasePage

  element(:improve_yes, "input[id$='comprehensive_restoration_true']", visible: false)
  element(:improve_no, "input[id$='comprehensive_restoration_false']", visible: false)

  def submit(args = {})
    if args[:improve]
      improve_yes.click
    else
      improve_no.click
    end

    submit_button.click
  end

end
