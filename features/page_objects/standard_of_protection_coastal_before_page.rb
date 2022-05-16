class StandardOfProtectionCoastalBeforePage < BasePage

  section(:user_bar, AdminUserBarSection, AdminUserBarSection::SELECTOR)

  element(:less_that_one_year, "#standard_of_protection_coastal_step_coastal_protection_before_0", visible: false)
  element(:one_to_four_years, "#standard_of_protection_coastal_step_coastal_protection_before_1", visible: false)
  element(:five_to_nine_years, "#standard_of_protection_coastal_step_coastal_protection_before_2", visible: false)
  element(:ten_years_or_more, "#standard_of_protection_coastal_step_coastal_protection_before_3", visible: false)

  element(:submit_button, "input[name='commit']")

  def submit(args = {})
    case args[:option]
    when :less_that_one_year
      less_than_one_year.click
    when :one_to_four_years
      one_to_four_years.click
    when :five_to_nine_years
      five_to_nine_years.click
    when :ten_years_or_more
      ten_years_or_more.click
    end
    submit_button.click
  end
end
