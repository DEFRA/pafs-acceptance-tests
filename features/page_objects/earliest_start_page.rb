class EarliestStartPage < BasePage

  section(:user_bar, AdminUserBarSection, AdminUserBarSection::SELECTOR)

  element(:start_sooner_yes, "#earliest-start-step-could-start-early-true-field", visible: false)
  element(:start_sooner_no, "#earliest-start-step-could-start-early-false-field", visible: false)

  def submit(args = {})
    if args[:earlier_start]
      start_sooner_yes.click
    else
      start_sooner_no.click
    end

    submit_button.click
  end

end
