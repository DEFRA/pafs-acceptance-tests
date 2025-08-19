class CarbonSummaryPage < BasePage

  section(:user_bar, UserBarSection, UserBarSection::SELECTOR)

  element(:capital_carbon, "#carbon-summary-carbon-summary div p:nth-child(1) .govuk-grid-column-one-quarter")
  element(:operational_carbon, "#carbon-summary-carbon-summary p:nth-child(2) .govuk-grid-column-one-quarter")
  element(:whole_life_carbon, "#carbon-summary-carbon-summary p:nth-child(3) .govuk-grid-column-one-quarter")
  element(:sequestered_carbon, "#carbon-summary-carbon-summary p:nth-child(4) .govuk-grid-column-one-quarter")
  element(:avoided_carbon, "#carbon-summary-carbon-summary p:nth-child(5) .govuk-grid-column-one-quarter")
  element(:net_carbon, "#carbon-summary-carbon-summary p:nth-child(6) .govuk-grid-column-one-quarter")
  element(:net_economic_benefit, "#carbon-summary-carbon-summary p:nth-child(7) .govuk-grid-column-one-quarter")
  element(:capital_cost, "p:nth-child(9) .govuk-grid-column-one-quarter")
  element(:operational_and_maintenance_cost, "div+ .govuk-grid-column-one-quarter")

  def submit(_args = {})
    submit_button.click
  end

end
