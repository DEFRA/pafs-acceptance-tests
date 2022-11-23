class NaturalFloodRiskMeasuresCostPage < BasePage

  section(:user_bar, AdminUserBarSection, AdminUserBarSection::SELECTOR)

  element(:total_cost, "#natural-flood-risk-measures-cost-step-natural-flood-risk-measures-cost-field")

  def submit(args = {})
    total_cost.set(args[:cost]) if args.key?(:cost)

    submit_button.click
  end

end
