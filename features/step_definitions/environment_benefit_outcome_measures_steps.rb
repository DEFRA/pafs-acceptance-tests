Given("I enter environmental outcomes improvements") do
  @app.proposal_overview_page.add_environmental_outcomes.click
  @app.environmental_outcomes_page.submit(
    improve: true
  )
  @app.intertidal_habitat_page.submit(
    improve: true
  )
  @wetland_amount = random_number
  @app.hectares_of_intertidal_habitat_page.submit(
    area: @wetland_amount
  )
  @app.woodland_habitat_page.submit(
    improve: true
  )
  @woodland_amount = random_number
  @app.hectares_of_woodland_habitat_page.submit(
    area: @woodland_amount
  )
  @app.wet_woodland_habitat_page.submit(
    improve: true
  )
  @wet_woodland_amount = random_number

  @app.hectares_of_wet_woodland_habitat_page.submit(
    area: @wet_woodland_amount
  )

  @app.wetland_habitat_page.submit(
    improve: true
  )
  @wet_grassland_amount = random_number
  @app.hectares_of_wetland_habitat_page.submit(
    area: @wet_grassland_amount
  )
  @app.grassland_habitat_page.submit(
    improve: true
  )
  @grassland_amount = random_number
  @app.hectares_of_grassland_habitat_page.submit(
    area: @grassland_amount
  )
  @app.heathland_habitat_page.submit(
    improve: true
  )
  @heathland_amount = random_number
  @app.hectares_of_heathland_habitat_page.submit(
    area: @heathland_amount
  )
  @app.lake_habitat_page.submit(
    improve: true
  )
  @lake_amount = random_number
  @app.hectares_of_lake_habitat_page.submit(
    area: @lake_amount
  )
  @app.arable_habitat_page.submit(
    improve: true
  )
  @arable_amount = random_number
  @app.hectares_of_arable_habitat_page.submit(
    area: @arable_amount
  )
  @app.comprehensive_restoration_habitat_page.submit(
    improve: true
  )
  @comprehensive_restoration_amount = random_number
  @app.kilometers_of_comprehensive_restoration_habitat_page.submit(
    area: @comprehensive_restoration_amount
  )
  @app.partial_restoration_habitat_page.submit(
    improve: true
  )
  @partial_restoration_amount = random_number
  @app.kilometers_of_partial_restoration_habitat_page.submit(
    area: @partial_restoration_amount
  )
  @app.watercourse_habitat_page.submit(
    improve: true
  )
  @watercourse_amount = random_number
  @app.kilometers_of_watercourse_habitat_page.submit(
    area: @watercourse_amount
  )
end

Given("I enter no environmental outcomes improvements") do
  @app.proposal_overview_page.add_environmental_outcomes.click
  @app.environmental_outcomes_page.submit(
    improve: false
  )
end

Then("I can see there are no environmental benefits in the proposal overview") do
  expect(@app.proposal_overview_page.environmental_outcomes_section).to have_text "This project does not include any environmental benefits"
end

Then("I can see the environmental outcomes improvements totals in the proposal overview") do
  expect(@app.proposal_overview_page.wetland_habitat_total).to have_text @wetland_amount
  expect(@app.proposal_overview_page.woodland_habitat_total).to have_text @woodland_amount
  expect(@app.proposal_overview_page.wet_woodland_habitat_total).to have_text @wet_woodland_amount
  expect(@app.proposal_overview_page.wet_grassland_habitat_total).to have_text @wet_grassland_amount
  expect(@app.proposal_overview_page.grassland_habitat_total).to have_text @grassland_amount
  expect(@app.proposal_overview_page.heathland_habitat_total).to have_text @heathland_amount
  expect(@app.proposal_overview_page.lake_habitat_total).to have_text @lake_amount
  expect(@app.proposal_overview_page.arable_habitat_total).to have_text @arable_amount
  expect(@app.proposal_overview_page.comprehensive_restoration_habitat_total).to have_text @comprehensive_restoration_amount
  expect(@app.proposal_overview_page.partial_restoration_habitat_total).to have_text @partial_restoration_amount
  expect(@app.proposal_overview_page.watercourse_habitat_total).to have_text @watercourse_amount
end
