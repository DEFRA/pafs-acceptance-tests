class AwardContractDatePage < BasePage

  section(:user_bar, UserBarSection, UserBarSection::SELECTOR)

  element(:month, "#award-contract-date-step-award-contract-month-field")
  element(:year, "#award-contract-date-step-award-contract-year-field")

  def submit(args = {})
    month.set(args[:month]) if args.key?(:month)
    year.set(args[:year]) if args.key?(:year)

    submit_button.click
  end

end
