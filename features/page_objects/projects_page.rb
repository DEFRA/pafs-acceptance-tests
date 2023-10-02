class ProjectsPage < BasePage

  section(:user_bar, AdminUserBarSection, AdminUserBarSection::SELECTOR)

  element(:create_proposal, "a[href='/pc/bootstraps/new']")
  element(:search_field, "#q")
  element(:show_all_projects, "a[href='/pc/projects?all=true']")
  elements(:project_links, ".project-link")
  element(:first_project_status, "tr:nth-child(1) td:nth-child(5)")
  element(:first_project_name, "tr:nth-child(1) td:nth-child(2)")

  def submit(args = {})
    search_field.set(args[:project_number]) if args.key?(:project_number)

    submit_button.click
  end

end
