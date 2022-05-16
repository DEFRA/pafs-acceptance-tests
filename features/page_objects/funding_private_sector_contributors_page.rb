class FundingPrivateSectorContributorsPage < BasePage

  section(:user_bar, AdminUserBarSection, AdminUserBarSection::SELECTOR)

  element(:private_contributors_names, "#private_contributors_step_private_contributor_names")
  element(:submit_button, "input[name='commit']")

  def submit(args = {})
    private_contributors_names.set(args[:private_contributors_names]) if args.key?(:private_contributors_names)
    submit_button.click
  end

end
