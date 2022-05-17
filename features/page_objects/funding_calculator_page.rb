class FundingCalculatorPage < BasePage

  section(:user_bar, AdminUserBarSection, AdminUserBarSection::SELECTOR)

  element(:signed_off_after, "#funding_calculator_step_expected_version_v9", visible: false)
  element(:signed_off_before, "#funding_calculator_step_expected_version_v8", visible: false)
  element(:choose_file, "#funding_calculator_step_funding_calculator")
  element(:submit_button, "input[name='commit']")

  def submit(args = {})
    case args[:option]
    when :Yes
      signed_off_after.click

    when :No
      signed_off_before.click
    end

    if args.key?(:file)
      filename = args[:file]
      attach_file(choose_file[:name], File.absolute_path("./features/support/#{filename}"))
    end

    submit_button.click
  end

end
