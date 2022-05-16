class StartConstructionDatePage < BasePage

  section(:user_bar, AdminUserBarSection, AdminUserBarSection::SELECTOR)

  element(:month, "#start_construction_date_step_start_construction_month")
  element(:year, "#start_construction_date_step_start_construction_year")

  element(:submit_button, "input[name='commit']")

  def submit(args = {})
    month.set(args[:month]) if args.key?(:month)
    year.set(args[:year]) if args.key?(:year)

    submit_button.click
  end

end
