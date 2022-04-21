class FundingOtherSectorContributorsPage < BasePage

  section(:user_bar, AdminUserBarSection, AdminUserBarSection::SELECTOR)

  element(:other_contributors_names, "#other_ea_contributors_step_other_ea_contributor_names")
  element(:submit_button, "input[name='commit']")

  def submit(args = {})
    other_contributors_names.set(args[:other_contributors_names]) if args.key?(:other_contributors_names)
    submit_button.click
  end

end
