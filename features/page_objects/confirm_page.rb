class ConfirmPage < BasePage

  section(:user_bar, UserBarSection, UserBarSection::SELECTOR)

  element(:project_number, ".govuk-panel__body strong")
  element(:return_to_proposals, ".govuk-main-wrapper a[href='/pc/projects']")

end
