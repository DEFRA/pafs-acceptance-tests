Given(/^I upload a project funding calculator file "([^"]*)"$/) do |filename|
  # Take Capital and Maintenance Cost from the filename
  @capital_and_maintenance_cost = remove_non_numerical_text(filename)
  @app.proposal_overview_page.add_funding_calculator.click
  @filename = filename
  @app.funding_calculator_page.submit(
    file: @filename
  )
  @app.funding_calculator_summary_page.submit
end

When("I can see the file has been uploaded in the proposal overview page") do
  expect(@app.proposal_overview_page.partnership_funding_section).to have_text(@filename)
end
