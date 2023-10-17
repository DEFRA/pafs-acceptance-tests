class StartConstructionDatePage < BasePage

  section(:user_bar, UserBarSection, UserBarSection::SELECTOR)

  element(:month, "#start-construction-date-step-start-construction-month-field")
  element(:year, "#start-construction-date-step-start-construction-year-field")

  def submit(args = {})
    month.set(args[:month]) if args.key?(:month)
    year.set(args[:year]) if args.key?(:year)

    submit_button.click
  end

end
