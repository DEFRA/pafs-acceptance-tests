# frozen_string_literal: true

class StandardOfProtectionCoastalAfterPage < BasePage

  section(:user_bar, AdminUserBarSection, AdminUserBarSection::SELECTOR)

  element(:less_that_ten_years, "#standard-of-protection-coastal-after-step-coastal-protection-after-0-field",
          visible: false)
  element(:ten_to_nighteen_years, "#standard-of-protection-coastal-after-step-coastal-protection-after-1-field",
          visible: false)
  element(:twenty_to_fourtynine_years, "#standard-of-protection-coastal-after-step-coastal-protection-after-2-field",
          visible: false)
  element(:fifty_years_or_more, "#standard-of-protection-coastal-after-step-coastal-protection-after-3-field",
          visible: false)

  def submit(args = {})
    case args[:option]
    when :less_that_ten_years
      less_that_ten_years.click
    when :ten_to_nighteen_years
      ten_to_nighteen_years.click
    when :twenty_to_fourtynine_years
      twenty_to_fourtynine_years.click
    when :fifty_years_or_more
      fifty_years_or_more.click
    end
    submit_button.click
  end

end
