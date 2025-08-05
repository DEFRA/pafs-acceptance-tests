Given(/^I upload a project funding calculator file "([^"]*)"$/) do |filename|
  @app.proposal_overview_page.add_funding_calculator.click
  @filename = filename
  @app.funding_calculator_page.submit(
    file: @filename
  )
  expect(@app.funding_calculator_summary_page.uploaded_file).to have_text(@filename)
  @app.funding_calculator_summary_page.submit
end

When("I can see the file has been uploaded in the proposal overview page") do
  expect(@app.proposal_overview_page.partnership_funding_section).to have_text(@filename)
end
