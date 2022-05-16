class MainRiskPage < BasePage

  section(:user_bar, AdminUserBarSection, AdminUserBarSection::SELECTOR)

  element(:first_risk, ".block-label:nth-of-type(1)")
  element(:last_risk, ".block-label:last-of-type")

  element(:submit_button, "input[name='commit']")

  def submit(args = {})
    if args[:choose_first]
      first_risk.click
    else
      last_risk.click
    end

    submit_button.click
  end

end
