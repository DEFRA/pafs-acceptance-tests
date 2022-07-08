class PartialRestorationHabitatPage < BasePage

  element(:improve_yes, "input[id$='partial_restoration_true']", visible: false)
  element(:improve_no, "input[id$='partial_restoration_false']", visible: false)

  def submit(args = {})
    if args[:improve]
      improve_yes.click
    else
      improve_no.click
    end

    submit_button.click
  end

end
