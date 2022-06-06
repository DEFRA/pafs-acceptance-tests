class NaturalFloodRiskMeasuresCostPage < BasePage

  section(:user_bar, AdminUserBarSection, AdminUserBarSection::SELECTOR)

  element(:total_cost, "#natural_flood_risk_measures_cost_step_natural_flood_risk_measures_cost")

  def submit(args = {})
    total_cost.set(args[:cost]) if args.key?(:cost)

    submit_button.click
  end

end
