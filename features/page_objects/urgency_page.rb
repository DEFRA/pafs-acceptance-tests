class UrgencyPage < BasePage

  section(:user_bar, UserBarSection, UserBarSection::SELECTOR)

  element(:nu, "#urgency-step-urgency-reason-not-urgent-field", visible: false)
  element(:stat, "#urgency-step-urgency-reason-statutory-need-field", visible: false)
  element(:legal, "#urgency-step-urgency-reason-legal-need-field", visible: false)
  element(:hs, "#urgency-step-urgency-reason-health-and-safety-field", visible: false)
  element(:emer, "#urgency-step-urgency-reason-emergency-works-field", visible: false)
  element(:time, "#urgency-step-urgency-reason-time-limited-field", visible: false)

  def submit(args = {})
    case args[:option]

    when :not_urgent
      nu.click
    when :stat_need
      stat.click
    when :legal_need
      legal.click
    when :health_and_safety
      hs.click
    when :emergency
      emer.click
    when :time_limit
      time.click
    end

    submit_button.click
  end

end
