Given(/^I add a location "([^"]*)"$/) do |location|
  @app.proposal_overview_page.add_location.click
  @app.location_page.submit(
    location: location.to_sym
  )
end

Given(/^I upload a benefit area file "([^"]*)"$/) do |filename|
  @app.benefit_area_file_page.submit(
    file: filename
  )
  @app.benefit_area_file_summary_page.submit
end
