class ProjectsPage < BasePage

  section(:user_bar, AdminUserBarSection, AdminUserBarSection::SELECTOR)

  element(:create_proposal, "a[href='/pc/bootstraps/new']")
  element(:search_field, "#q")
  element(:show_all_projects, "a[href='/pc/projects?all=true']")
  elements(:project_links, ".project-link")

  def submit(args = {})
    search_field.set(args[:project_number]) if args.key?(:project_number)

    submit_button.click
  end

end
