class EnvironmentalOutcomesPage < BasePage

  section(:user_bar, AdminUserBarSection, AdminUserBarSection::SELECTOR)

  element(:improve_yes, "#any-environmental-benefits-step-environmental-benefits-true-field", visible: false)
  element(:improve_no, "#any-environmental-benefits-step-environmental-benefits-false-field", visible: false)

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
