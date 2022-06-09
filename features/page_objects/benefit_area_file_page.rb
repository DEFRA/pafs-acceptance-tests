class BenefitAreaFilePage < BasePage

  section(:user_bar, AdminUserBarSection, AdminUserBarSection::SELECTOR)

  element(:choose_file, "#benefit_area_file_step_benefit_area_file")
  element(:submit_button, "input[name='commit']")

  def submit(args = {})
    if args.key?(:file)
      filename = args[:file]
      attach_file(choose_file[:name], File.absolute_path("./features/support/#{filename}"))
    end

    submit_button.click
  end

end
