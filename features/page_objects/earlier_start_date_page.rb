class EarlierStartDatePage < BasePage

  section(:user_bar, UserBarSection, UserBarSection::SELECTOR)

  element(:month, "#earliest-start-date-with-gia-step-earliest-with-gia-month-field")
  element(:year, "#earliest-start-date-with-gia-step-earliest-with-gia-year-field")

  def submit(args = {})
    month.set(args[:month]) if args.key?(:month)
    year.set(args[:year]) if args.key?(:year)

    submit_button.click
  end

end
