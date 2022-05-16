class NewFundingPublicSectorContributorsPage < BasePage

  section(:user_bar, AdminUserBarSection, AdminUserBarSection::SELECTOR)

  element(:new_public_contributors_names, "#name_0_current")
  element(:submit_button, "input[name='commit']")

  def submit(args = {})
    public_contributors_names.set(args[:new_public_contributors_names]) if args.key?(:new_public_contributors_names)
    submit_button.click
  end

end
