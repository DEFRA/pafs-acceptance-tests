class NewFundingPrivateSectorContributorsPage < BasePage

  section(:user_bar, AdminUserBarSection, AdminUserBarSection::SELECTOR)

  element(:new_private_contributors_names, "#name_0_current")
  element(:submit_button, "input[name='commit']")

  def submit(args = {})
    private_contributors_names.set(args[:new_private_contributors_names]) if args.key?(:new_private_contributors_names)
    submit_button.click
  end

end
