class EarliestStartDatePage < BasePage

  section(:user_bar, AdminUserBarSection, AdminUserBarSection::SELECTOR)

  element(:month, "#earliest-date-step-earliest-start-month-field")
  element(:year, "#earliest-date-step-earliest-start-year-field")

  def submit(args = {})
    month.set(args[:month]) if args.key?(:month)
    year.set(args[:year]) if args.key?(:year)

    submit_button.click
  end

end
