class GrantInAidFundingPage < BasePage

  section(:user_bar, AdminUserBarSection, AdminUserBarSection::SELECTOR)

  element(:gia_yes, "#funding_sources_step_fcerm_gia")
  element(:gia_no, "#funding_sources_step_fcerm_gia")

  element(:submit_button, "input[name='commit']")

  def submit(args = {})
    if args[:grant_in_aid]
      gia_yes.click
    else
      gia_no.click
    end

    submit_button.click
  end

end
