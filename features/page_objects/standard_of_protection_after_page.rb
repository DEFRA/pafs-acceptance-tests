# frozen_string_literal: true

class StandardOfProtectionAfterPage < BasePage

  section(:user_bar, AdminUserBarSection, AdminUserBarSection::SELECTOR)

  element(:very_significant, "#standard-of-protection-after-step-flood-protection-after-0-field", visible: false)
  element(:significant, "#standard-of-protection-after-step-flood-protection-after-1-field", visible: false)
  element(:moderate, "#standard-of-protection-after-step-flood-protection-after-2-field", visible: false)
  element(:low, "#standard-of-protection-after-step-flood-protection-after-3-field", visible: false)

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
