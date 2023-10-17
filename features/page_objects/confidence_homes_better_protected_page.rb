# frozen_string_literal: true

class ConfidenceHomesBetterProtectedPage < BasePage

  section(:user_bar, UserBarSection, UserBarSection::SELECTOR)

  element(:high, "#confidence-homes-better-protected-step-confidence-homes-better-protected-high-field", visible: false)
  element(:mednium_high, "#confidence-homes-better-protected-step-confidence-homes-better-protected-medium-high-field",
          visible: false)
  element(:medium_low, "#confidence-homes-better-protected-step-confidence-homes-better-protected-medium-low-field",
          visible: false)
  element(:low, "#confidence-homes-better-protected-step-confidence-homes-better-protected-low-field", visible: false)
  element(:not_applicable,
          "[id^='confidence-homes-better-protected']", visible: false)

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
