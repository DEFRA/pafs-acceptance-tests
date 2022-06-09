# frozen_string_literal: true

class StandardOfProtectionAfterPage < BasePage

  section(:user_bar, AdminUserBarSection, AdminUserBarSection::SELECTOR)

  COMMON_SELECTOR = "standard_of_protection_after_step_flood_protection_after"
  element(:very_significant, "##{COMMON_SELECTOR}_0", visible: false)
  element(:significant, "##{COMMON_SELECTOR}_1", visible: false)
  element(:moderate, "##{COMMON_SELECTOR}_2", visible: false)
  element(:low, "##{COMMON_SELECTOR}_3", visible: false)

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
