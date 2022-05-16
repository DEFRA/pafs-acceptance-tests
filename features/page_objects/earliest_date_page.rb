class EarliestDatePage < BasePage

  section(:user_bar, AdminUserBarSection, AdminUserBarSection::SELECTOR)

  element(:month, "#earliest_date_step_earliest_start_month")
  element(:year, "#earliest_date_step_earliest_start_year")

  element(:submit_button, "input[name='commit']")

  def submit(args = {})
    month.set(args[:month]) if args.key?(:month)
    year.set(args[:year]) if args.key?(:year)

    submit_button.click
  end

end
