class StartOutlineBusinessCaseDatePage < BasePage

  section(:user_bar, AdminUserBarSection, AdminUserBarSection::SELECTOR)

  element(:month, "#start_outline_business_case_date_step_start_outline_business_case_month")
  element(:year, "#start_outline_business_case_date_step_start_outline_business_case_year")

  element(:submit_button, "input[name='commit']")

  def submit(args = {})
    month.set(args[:month]) if args.key?(:month)
    year.set(args[:year]) if args.key?(:year)

    submit_button.click
  end

end
