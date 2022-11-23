# frozen_string_literal: true

class BasePage < SitePrism::Page

  element(:back_link, ".govuk-back-link")
  element(:heading, "h1")
  element(:content, "#main-content")
  element(:error, ".govuk-error-summary")
  element(:error_summary, ".govuk-error-summary__body")
  element(:submit_button, "[type='submit']")
  element(:accept_analytics_cookies, "input[value='Accept analytics cookies']", visible: true)
  element(:reject_analytics_cookies, "input[value='Reject analytics cookies']", visible: true)
  element(:hide_cookie_message, "input[value='Hide this message']", visible: true)
  element(:button, ".govuk-button")

  def submit(_args = {})
    submit_button.click
  end

  def cookie_choice(args = {})
    case args[:choice]
    when :accept
      accept_cookies
    when :reject
      reject_cookies
    end
    hide_cookie_message.click
  end

  def accept_cookies
    return unless has_accept_analytics_cookies?

    accept_analytics_cookies.click
  end

  def reject_cookies
    return unless has_accept_analytics_cookies?

    reject_analytics_cookies.click
  end

end
