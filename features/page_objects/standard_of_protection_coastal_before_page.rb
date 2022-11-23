class StandardOfProtectionCoastalBeforePage < BasePage

  section(:user_bar, AdminUserBarSection, AdminUserBarSection::SELECTOR)

  element(:less_that_one_year, "#standard-of-protection-coastal-step-coastal-protection-before-0-field", visible: false)
  element(:one_to_four_years, "#standard-of-protection-coastal-step-coastal-protection-before-1-field", visible: false)
  element(:five_to_nine_years, "#standard-of-protection-coastal-step-coastal-protection-before-2-field", visible: false)
  element(:ten_years_or_more, "#standard-of-protection-coastal-step-coastal-protection-before-3-field", visible: false)

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
