class StandardOfProtectionAfterPage < SitePrism::Page

  section(:user_bar, AdminUserBarSection, AdminUserBarSection::SELECTOR)

  element(:very_significant, "#standard_of_protection_after_step_flood_protection_after_0")
  element(:significant, "#standard_of_protection_after_step_flood_protection_after_1")
  element(:moderate, "#standard_of_protection_after_step_flood_protection_after_2")
  element(:low, "#standard_of_protection_after_step_flood_protection_after_3")

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
