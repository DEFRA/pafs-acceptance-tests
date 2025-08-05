class FundingCalculatorPage < BasePage

  section(:user_bar, UserBarSection, UserBarSection::SELECTOR)

  element(:funding_calculator_2020_link, "a[href$='calculator-2020-for-fcerm-grant-in-aid-gia']")
  element(:choose_file, "#funding-calculator-step-funding-calculator-field")

  def submit(args = {})
    if args.key?(:file)
      filename = args[:file]
      attach_file(choose_file[:name], File.absolute_path("./features/support/#{filename}"))
    end

    submit_button.click
  end

end
