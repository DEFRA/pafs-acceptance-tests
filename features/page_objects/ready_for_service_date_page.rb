class ReadyForServiceDatePage < BasePage

  section(:user_bar, AdminUserBarSection, AdminUserBarSection::SELECTOR)

  element(:month, "#ready_for_service_date_step_ready_for_service_month")
  element(:year, "#ready_for_service_date_step_ready_for_service_year")

  element(:submit_button, "input[name='commit']")

  def submit(args = {})
    month.set(args[:month]) if args.key?(:month)
    year.set(args[:year]) if args.key?(:year)

    submit_button.click
  end

end
