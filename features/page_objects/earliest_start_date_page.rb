class EarliestStartDatePage < BasePage

  section(:user_bar, UserBarSection, UserBarSection::SELECTOR)

  element(:month, "#earliest-start-date-step-earliest-start-month-field")
  element(:year, "#earliest-start-date-step-earliest-start-year-field")

  def submit(args = {})
    month.set(args[:month]) if args.key?(:month)
    year.set(args[:year]) if args.key?(:year)

    submit_button.click
  end

end
