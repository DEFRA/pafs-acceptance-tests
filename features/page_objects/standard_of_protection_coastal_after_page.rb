# frozen_string_literal: true

class StandardOfProtectionCoastalAfterPage < BasePage

  section(:user_bar, AdminUserBarSection, AdminUserBarSection::SELECTOR)

  COMMON_SELECTOR = "standard_of_protection_coastal_after_step_coastal_protection_after"
  element(:less_that_ten_years, "##{COMMON_SELECTOR}_0", visible: false)
  element(:ten_to_nighteen_years, "##{COMMON_SELECTOR}_1", visible: false)
  element(:twenty_to_fourtynine_years, "##{COMMON_SELECTOR}_2", visible: false)
  element(:fifty_years_or_more, "##{COMMON_SELECTOR}_3", visible: false)

  element(:submit_button, "input[name='commit']")

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
