Given(/^I upload a project funding calculator file "([^"]*)"$/) do |filename|
  @filename = filename
  @app.funding_calculator_page.submit(
    file: @filename
  )
end

Given(/^I upload a project funding calculator with file option "([^"]*)", "([^"]*)"$/) do |radiotype, filename|
  @app.proposal_overview_page.add_funding_calculator.click
  @app.funding_calculator_page.submit(
    option: radiotype.to_sym,
    file: filename
  )
  @app.funding_calculator_summary_page.submit
end

When("I can see the file has been uploaded in the summary page") do
  expect(@app.funding_calculator_summary_page.uploaded_file).to have_text(@filename)
end
