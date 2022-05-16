class ProjectAreaSelectionPage < BasePage

  section(:user_bar, AdminUserBarSection, AdminUserBarSection::SELECTOR)

  elements(:source, "input[type='radio']", visible: false)
  element(:submit_button, "input[name='commit']")

  def submit(args = {})
    source.find { |btn| btn.value == args[:areasource].to_s }.click if args.key?(:areasource)
    submit_button.click
  end

end
