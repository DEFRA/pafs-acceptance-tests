class ProjectNamePage < BasePage

  section(:user_bar, UserBarSection, UserBarSection::SELECTOR)

  element(:project_name, "#project-name-step-name-field")

  def submit(args = {})
    project_name.set(args[:project_name]) if args.key?(:project_name)

    submit_button.click
  end

end
