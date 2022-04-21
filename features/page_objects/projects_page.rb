class ProjectsPage < BasePage

  section(:user_bar, AdminUserBarSection, AdminUserBarSection::SELECTOR)

  element(:create_proposal, "a[href='/pc/bootstraps/new']")

  def submit(args = {})
    search_field.set(args[@exemption_number]) if args.key?(@exemption_number)
    select_search(args[:type])

    search_button.click
  end

end
