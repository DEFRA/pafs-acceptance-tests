class StandardOfProtectionPage < BasePage

  section(:user_bar, AdminUserBarSection, AdminUserBarSection::SELECTOR)

  element(:very_significant, "#standard_of_protection_step_flood_protection_before_0", visible: false)
  element(:significant, "#standard_of_protection_step_flood_protection_before_1", visible: false)
  element(:moderate, "#standard_of_protection_step_flood_protection_before_2", visible: false)
  element(:low, "#standard_of_protection_step_flood_protection_before_3", visible: false)

  element(:submit_button, "input[name='commit']")

  def submit(args = {})
    case args[:option]
    when :very_significant_risk
      very_significant.click
    when :significant_risk
      significant.click
    when :moderate_risk
      moderate.click
    when :low_risk
      low.click
    end
    submit_button.click
  end

end
