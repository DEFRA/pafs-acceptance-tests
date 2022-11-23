class ReadyForServiceDatePage < BasePage

  section(:user_bar, AdminUserBarSection, AdminUserBarSection::SELECTOR)

  element(:month, "#ready-for-service-date-step-ready-for-service-month-field")
  element(:year, "#ready-for-service-date-step-ready-for-service-year-field")

  def submit(args = {})
    month.set(args[:month]) if args.key?(:month)
    year.set(args[:year]) if args.key?(:year)

    submit_button.click
  end

end
