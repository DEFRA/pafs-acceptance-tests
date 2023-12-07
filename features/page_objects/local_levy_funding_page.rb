class LocalLevyFundingPage < BasePage

  section(:user_bar, UserBarSection, UserBarSection::SELECTOR)

  element(:local_levy_yes, "#funding_sources_step_local_levy")
  element(:local_levy_no, "#funding_sources_step_local_levy")

  def submit(args = {})
    if args[:local_levy_funding]
      local_levy_yes.click
    else
      local_levy_no.click
    end

    submit_button.click
  end

end
