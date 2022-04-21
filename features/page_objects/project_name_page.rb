class ProjectNamePage < BasePage

  section(:user_bar, AdminUserBarSection, AdminUserBarSection::SELECTOR)

  element(:project_name, "#project_name_step_name")

  element(:submit_button, "input[name='commit']")

  def submit(args = {})
    project_name.set(args[:project_name]) if args.key?(:project_name)

    submit_button.click
  end

end
