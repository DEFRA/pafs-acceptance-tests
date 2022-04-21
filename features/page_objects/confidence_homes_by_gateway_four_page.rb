# frozen_string_literal: true

class ConfidenceHomesByGatewayFourPage < BasePage

  section(:user_bar, AdminUserBarSection, AdminUserBarSection::SELECTOR)

  COMMON_SELECTOR = "confidence_homes_by_gateway_four_step_confidence_homes_by_gateway_four"
  element(:high, "##{COMMON_SELECTOR}_high", visible: false)
  element(:mednium_high, "##{COMMON_SELECTOR}_medium_high", visible: false)
  element(:medium_low, "##{COMMON_SELECTOR}_medium_low", visible: false)
  element(:low, "##{COMMON_SELECTOR}_low", visible: false)
  element(:not_applicable, "##{COMMON_SELECTOR}_not_applicable", visible: false)
  element(:submit_button, "input[name='commit']")

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
