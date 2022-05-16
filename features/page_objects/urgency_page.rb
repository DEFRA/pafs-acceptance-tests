class UrgencyPage < BasePage

  section(:user_bar, AdminUserBarSection, AdminUserBarSection::SELECTOR)

  element(:nu, "#urgency_step_urgency_reason_not_urgent", visible: false)
  element(:stat, "#urgency_step_urgency_reason_statutory_need", visible: false)
  element(:legal, "#urgency_step_urgency_reason_legal_need", visible: false)
  element(:hs, "#urgency_step_urgency_reason_health_and_safety", visible: false)
  element(:emer, "#urgency_step_urgency_reason_emergency_works", visible: false)
  element(:time, "#urgency_step_urgency_reason_time_limited", visible: false)

  element(:submit_button, "input[name='commit']", visible: false)

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
