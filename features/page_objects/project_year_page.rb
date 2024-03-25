class ProjectYearPage < BasePage

  section(:user_bar, UserBarSection, UserBarSection::SELECTOR)

  elements(:years, "input[name='financial_year_step[project_end_financial_year]']", visible: false)

  # href that ends with financial_year_alternative
  element(:later_year, "a[href$='financial_year_alternative']")

  def submit(args = {})
    years.find { |btn| btn.value == args[:option].to_s }.click if args.key?(:option)

    submit_button.click
  end

end
