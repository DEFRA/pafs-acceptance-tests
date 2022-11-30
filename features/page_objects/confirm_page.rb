class ConfirmPage < BasePage

  section(:user_bar, AdminUserBarSection, AdminUserBarSection::SELECTOR)

  element(:project_number, ".govuk-panel__body strong")
  element(:return_to_proposals, "a[href='pc/projects']")

end
