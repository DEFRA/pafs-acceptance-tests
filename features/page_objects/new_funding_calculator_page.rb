class NewFundingCalculatorPage < BasePage

  section(:user_bar, AdminUserBarSection, AdminUserBarSection::SELECTOR)

  element(:radio_Yes, "#funding_calculator_step_expected_version_v9", visible: false)
  element(:radio_No, "#funding_calculator_step_expected_version_v8", visible: false)
  element(:choose_file, "#funding_calculator_step_funding_calculator")
  element(:submit_button, "input[name='commit']")

  def submit(args = {})
    case args[:option]
    # Changing the current standard of service....
    when :Yes
      radio_Yes.click
      filename = args[:file]
      attach_file(choose_file[:name], File.absolute_path("./features/support/#{filename}"))

    # Restore the standard of service.....
    when :No
      radio_No.click
      filename = args[:file]
      attach_file(choose_file[:name], File.absolute_path("./features/support/#{filename}"))
    end

    submit_button.click
  end

end
