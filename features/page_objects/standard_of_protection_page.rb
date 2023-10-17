class StandardOfProtectionPage < BasePage

  section(:user_bar, UserBarSection, UserBarSection::SELECTOR)

  element(:very_significant, "#standard-of-protection-step-flood-protection-before-0-field", visible: false)
  element(:significant, "#standard-of-protection-step-flood-protection-before-1-field", visible: false)
  element(:moderate, "#standard-of-protection-step-flood-protection-before-2-field", visible: false)
  element(:low, "#standard-of-protection-step-flood-protection-before-3-field", visible: false)

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
