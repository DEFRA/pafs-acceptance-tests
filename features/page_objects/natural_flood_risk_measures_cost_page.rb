class NaturalFloodRiskMeasuresCostPage < BasePage

  section(:user_bar, AdminUserBarSection, AdminUserBarSection::SELECTOR)

  element(:total_cost, "a")

  def submit(args = {})
    total_cost.set(args[:cost]) if args.key?(:cost)

    submit_button.click
  end

end
