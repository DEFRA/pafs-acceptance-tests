# frozen_string_literal: true

class ConfidenceHomesByGatewayFourPage < BasePage

  section(:user_bar, AdminUserBarSection, AdminUserBarSection::SELECTOR)

  element(:high, "#confidence-homes-by-gateway-four-step-confidence-homes-by-gateway-four-high-field", visible: false)
  element(:mednium_high, "#confidence-homes-by-gateway-four-step-confidence-homes-by-gateway-four-medium-high-field",
          visible: false)
  element(:medium_low, "#confidence-homes-by-gateway-four-step-confidence-homes-by-gateway-four-medium-low-field",
          visible: false)
  element(:low, "#confidence-homes-by-gateway-four-step-confidence-homes-by-gateway-four-low-field", visible: false)
  element(:not_applicable, "[id^='confidence-homes-by-gateway-four']", visible: false)

  def submit(args = {})
    case args[:option]
    when :high
      high.click
    when :mednium_high
      medium_high.click
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
