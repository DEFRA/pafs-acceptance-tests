class CarbonImpactCalculationsPage < BasePage

  section(:user_bar, UserBarSection, UserBarSection::SELECTOR)

  element(:capital_carbon, "p:nth-child(5) .govuk-grid-column-one-quarter")
  element(:capital_carbon_baseline, "p:nth-child(6) .govuk-grid-column-one-quarter")
  element(:captital_carbon_targe, "p:nth-child(7) .govuk-grid-column-one-quarter")

  element(:operational_carbon, "p:nth-child(11) .govuk-grid-column-one-quarter")
  element(:operation_baseline_carbon, "p:nth-child(12) .govuk-grid-column-one-quarter")
  element(:operation_target_carbon, "p:nth-child(13) .govuk-grid-column-one-quarter")
  element(:net_carbon, "p:nth-child(17) .govuk-grid-column-one-quarter")
  element(:net_carbon_with_blank_values_calculated, "p:nth-child(18) .govuk-grid-column-one-quarter")

  def submit(_args = {})
    submit_button.click
  end

end
