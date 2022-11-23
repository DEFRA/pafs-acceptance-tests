# OM Risk Sources
Given(/^I add my project risks? "([^"]*)"$/) do |risk_source|
  @app.proposal_overview_page.add_risks.click
  @risk_source = []
  risk_source.split.each do |risk|
    slug_risksource = {
      "river" => "fluvial-flooding",
      "tidal" => "tidal-flooding",
      "ground" => "groundwater-flooding",
      "surface" => "surface_water-flooding",
      "sea" => "sea-flooding",
      "reservoir" => "reservoir-flooding",
      "coastal" => "coastal-erosion"
    }.freeze

    @risk_source << slug_risksource[risk]
    @app.risks_page.submit(
      risks_source: slug_risksource[risk]
    )
  end
  @app.risks_page.submit_button.click
  # If more than one risk, picks the first risk as the main risk
  @app.main_risk_page.submit if @risk_source.length > 1
end

Given("I add no flood protection outcome") do
  @app.flood_protection_outcomes_page.submit(
    benefit: :none
  )
end

Given("I add the flood protection 2040 outcome as none") do
  @app.flood_protection_outcomes_2040_page.submit(
    benefit: :none
  )
end

Given("I add no coastal erosion protection outcome") do
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

Then(/^I can see the flood risks? in the proposal overview$/) do
  @risk_source.each do |risk|
    expect(@app.proposal_overview_page.project_risks_section).to have_text remove_hyphen_and_capitalise_start(risk)
  end
end

Then("I will not be shown a risks and properties benefiting section") do
  expect(@app.proposal_overview_page).to have_no_add_risks
end

Then("I can see Households affected by flooding that benefit from the project by 2040 in the proposal overview") do
  pending # Write code here that turns the phrase above into concrete actions
end

Then("I can see {string} is the main project risk") do |risk|
  expect(@app.proposal_overview_page.project_risks_section).to have_text("#{risk} - Main source of risk")
end
