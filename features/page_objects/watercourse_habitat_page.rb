class WatercourseHabitatPage < BasePage

  element(:improve_yes, "input[id$='create-habitat-watercourse-step-create-habitat-watercourse-true-field']",
          visible: false)
  element(:improve_no, "input[id$='create-habitat-watercourse-step-create-habitat-watercourse-true-field']",
          visible: false)

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
