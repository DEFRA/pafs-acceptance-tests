When("I choose my project has natural flood risk measures") do
  expect(@app.natural_flood_risk_measures_question_page).to have_guidance
  @app.natural_flood_risk_measures_question_page.submit(choice: :yes)
end

When("I choose my project has no natural flood risk measures") do
  expect(@app.natural_flood_risk_measures_question_page).to have_guidance
  @app.natural_flood_risk_measures_question_page.submit(choice: :no)
end

When("I select my natural flood measures") do
  @app.natural_flood_risk_measures_page.submit(measures: %w[floodplain_restoration river_restoration])
end

When("I enter my total cost of natural flood measures") do
  @natural_flood_risk_measures_cost = 1_000_000
  @app.natural_flood_risk_measures_cost_page.submit(cost: @natural_flood_risk_measures_cost)
end

Then("I can see the project does not include any flood risk measures in the proposal overview") do
  expect(@app.proposal_overview_page.natural_flood_measures_section).to have_text("The project does not include any flood risk measures")
end

Then("I can see the natural flood risk measures in the proposal overview") do
  expect(@app.proposal_overview_page.natural_flood_measures_section).to have_text("Floodplain restoration")
  expect(@app.proposal_overview_page.natural_flood_measures_section).to have_text("River restoration")
end

Then("I can see the total cost of my associated natural flood risk measures in the proposal overview") do
  expect(@app.proposal_overview_page.natural_flood_measures_section).to have_text convert_to_currency_format(@natural_flood_risk_measures_cost)
end

When("I complete the natural flood measures task") do
  @app.proposal_overview_page.add_natural_flood_measures.click
  @app.natural_flood_risk_measures_question_page.submit(choice: :yes)
  @app.natural_flood_risk_measures_page.submit(measures: %w[leaky_barriers floodplain_woodland riparian_woodland])
  @app.natural_flood_risk_measures_cost_page.submit(cost: 12_345_678)
end
