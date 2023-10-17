class FundingCalculatorPage < BasePage

  section(:user_bar, UserBarSection, UserBarSection::SELECTOR)

  element(:signed_off_after, "#funding-calculator-step-expected-version-v9-field", visible: false)
  element(:signed_off_before, "#funding-calculator-step-expected-version-v8-field", visible: false)
  element(:funding_calculator_2020_link, "a[href$='calculator-2020-for-fcerm-grant-in-aid-gia']")
  element(:choose_file, "#funding-calculator-step-funding-calculator-field")

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
