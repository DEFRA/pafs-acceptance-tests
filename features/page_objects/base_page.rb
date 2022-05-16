# frozen_string_literal: true

class BasePage < SitePrism::Page

  element(:back_link, ".govuk-back-link")
  element(:heading, "h1")
  element(:content, "#main-content")
  element(:error, ".govuk-error-summary")
  element(:error_summary, ".govuk-error-summary__body")
  element(:submit_button, "[type='submit']")
  element(:accept_analytics_cookies, "button[data-accept-cookies='true']")
  element(:reject_analytics_cookies, ".govuk-button[data-hide-cookie-banner='true']")
  element(:hide_cookie_banner, "button[data-hide-cookie-banner='true'")
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
  end

  def accept_cookies
    return unless has_accept_analytics_cookies?

    accept_analytics_cookies.click
    hide_cookie_banner.click
  end

  def reject_cookies
    return unless has_accept_analytics_cookies?

    reject_analytics_cookies.click
  end

end
