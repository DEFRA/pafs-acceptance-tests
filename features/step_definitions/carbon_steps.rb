Given("I select to complete the carbon net zero section") do
  @app.proposal_overview_page.add_carbon.click
end

Given("I have read the carbon impact guidance") do
  @app.carbon_impact_guidance_page.submit
end


Given(/^I add how much capital carbon will this project produce in tonnes "([^"]*)"$/) do |value|
  @app.carbon_cost_build_page.submit(
    amount: value.to_sym
  )
end

Given(/^I add how much carbon will this project’s assets produce in their lifecycle "([^"]*)"$/) do |value|
  @app.carbon_cost_operation_page.submit(
    amount: value.to_sym
  )
end
