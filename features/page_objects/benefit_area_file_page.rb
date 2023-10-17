class BenefitAreaFilePage < BasePage

  section(:user_bar, UserBarSection, UserBarSection::SELECTOR)

  element(:choose_file, "#benefit-area-file-step-benefit-area-file-field")

  def submit(args = {})
    if args.key?(:file)
      filename = args[:file]
      attach_file(choose_file[:name], File.absolute_path("./features/support/#{filename}"))
    end

    submit_button.click
  end

end
