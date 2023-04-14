class OutlineBusinessCaseStartDatePage < BasePage

  section(:user_bar, AdminUserBarSection, AdminUserBarSection::SELECTOR)

  element(:month, "#start-outline-business-case-date-step-start-outline-business-case-month-field")
  element(:year, "#start-outline-business-case-date-step-start-outline-business-case-year-field")

  def submit(args = {})
    month.set(args[:month]) if args.key?(:month)
    year.set(args[:year]) if args.key?(:year)

    submit_button.click
  end

end
