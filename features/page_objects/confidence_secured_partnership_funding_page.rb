class ConfidenceSecuredPartnershipFundingPage < BasePage

  section(:user_bar, AdminUserBarSection, AdminUserBarSection::SELECTOR)
  # rubocop:disable Layout/LineLength
  element(:high, "#confidence-secured-partnership-funding-step-confidence-secured-partnership-funding-high-field", visible: false)
  element(:mednium_high, "#confidence-secured-partnership-funding-step-confidence-secured-partnership-funding-medium-high-field", visible: false)
  element(:medium_low, "#confidence-secured-partnership-funding-step-confidence-secured-partnership-funding-medium-low-field", visible: false)
  element(:low, "#confidence-secured-partnership-funding-step-confidence-secured-partnership-funding-low-field", visible: false)
  element(:not_applicable, "#confidence-secured-partnership-funding-step-confidence-secured-partnership-funding-not-applicable-field", visible: false)

  # rubocop:enable Layout/LineLength

  def submit(args = {})
    case args[:option]
    when :high
      high.click
    when :mednium_high
      mednium_high.click
    when :medium_low
      medium_low.click
    when :low
      low.click
    when :not_applicable
      not_applicable.click
    end

    submit_button.click
  end

end
