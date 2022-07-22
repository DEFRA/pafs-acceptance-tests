# OM Risk Sources
Given(/^I add my project risks? "([^"]*)"$/) do |risk_source|
  @app.proposal_overview_page.add_risks.click
  risk_source.split.each do |risk|
    slug_risksource = {
      "river" => "fluvial_flooding",
      "tidal" => "tidal_flooding",
      "ground" => "groundwater_flooding",
      "surface" => "surface_water_flooding",
      "sea" => "sea_flooding",
      "reservoir" => "reservoir_flooding",
      "coastal" => "coastal_erosion"
    }.freeze
    @risk_source = []
    @risk_source << slug_risksource[risk]
    @app.risks_page.submit(
      risks_source: [@risk_source]
    )
  end
  @app.risks_page.submit_button.click
  if @app.main_risk_page.heading.has_text? "What is the main source of risk the project will protect against?"
    @app.main_risk_page.submit
  end
end

Given(/^I add the flood protection outcome as none$/) do
  @app.flood_protection_outcomes_page.submit(
    benefit: :none
  )
end

Given("I add the flood protection 2040 outcome as none") do
  @app.flood_protection_outcomes_2040_page.submit(
    benefit: :none
  )
end

Given(/^I add the coastal erosion protection outcome as none$/) do
  @app.coastal_erosion_protection_outcomes_page.submit(
    benefit: :none
  )
end

When("I add the coastal erosion protection outcome values") do
  @app.coastal_erosion_protection_outcomes_page.submit(benefit: :random)
end

Given("I complete the flood protection outcome values") do
  @app.flood_protection_outcomes_page.submit(benefit: :random)
end

When("I complete the flood protection outcome values for 2040") do
  @app.flood_protection_outcomes_2040_page.submit(benefit: :random)
end

Then(/^I can see flood risks? in the proposal overview$/) do
  @risk_source.each do |risk|
    expect(@app.proposal_overview_page.project_risks_section).to have_text remove_camel_case_and_capitalise_start(risk)
  end
end

Then("I will not be shown a risks and properties benefiting section") do
  expect(@app.proposal_overview_page).to have_no_add_risks
end

Then("I can see Households affected by flooding that benefit from the project by 2040 in the proposal overview") do
  pending # Write code here that turns the phrase above into concrete actions
end

Then("I can see {string} is the main project risk") do |_string|
  pending # Write code here that turns the phrase above into concrete actions
end
