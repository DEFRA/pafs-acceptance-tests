class ProjectYearAlternativePage < BasePage

  section(:user_bar, UserBarSection, UserBarSection::SELECTOR)

  element(:year, "#financial-year-alternative-step-project-end-financial-year-field", visible: false)

  def submit(args = {})
    year.set(args[:year]) if args.key?(:year)

    submit_button.click
  end

end
