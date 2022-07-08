class PartialRestorationHabitatPage < BasePage

  element(:improve_yes, "input[id$='partial_restoration_true']", visible: false)
  element(:improve_no, "input[id$='partial_restoration_false']", visible: false)

  def submit(args = {})
    case args[:improve]
    when true
      improve_yes.click
    when false
      improve_no.click
    end

    submit_button.click
  end

end
