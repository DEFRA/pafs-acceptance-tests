class NewFundingOtherSectorContributorsPage < BasePage

  section(:user_bar, AdminUserBarSection, AdminUserBarSection::SELECTOR)

  element(:new_other_contributors_names, "#name_0_current")
  element(:submit_button, "input[name='commit']")

  def submit(args = {})
    other_contributors_names.set(args[:new_other_contributors_names]) if args.key?(:new_other_contributors_names)
    submit_button.click
  end

end
