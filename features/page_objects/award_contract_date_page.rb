class AwardContractDatePage < BasePage

  section(:user_bar, AdminUserBarSection, AdminUserBarSection::SELECTOR)

  element(:month, "#award_contract_date_step_award_contract_month")
  element(:year, "#award_contract_date_step_award_contract_year")

  element(:submit_button, "input[name='commit']")

  def submit(args = {})
    month.set(args[:month]) if args.key?(:month)
    year.set(args[:year]) if args.key?(:year)

    submit_button.click
  end

end
