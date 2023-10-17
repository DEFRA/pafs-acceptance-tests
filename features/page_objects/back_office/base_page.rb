# frozen_string_literal: true

class BasePage < SitePrism::Page

  element(:back_link, ".govuk-back-link")
  element(:heading, "h1")
  element(:content, "#main-content")
  element(:error, ".govuk-error-summary")
  element(:error_summary, ".govuk-error-summary__body")
  element(:submit_button, "[type='submit']")
  element(:button, ".govuk-button")

  def submit(_args = {})
    submit_button.click
  end

end
