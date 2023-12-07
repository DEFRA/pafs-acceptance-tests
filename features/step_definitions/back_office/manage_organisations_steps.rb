Given("I choose to manage organisations") do
  @app.manage_organisation_page.admin_bar.manage_organisations.click
end

Given("I search for {string} {string}") do |organisation_type, organisation|
  @app.manage_organisation_page.search(organisation: organisation, organisation_type: organisation_type)
  expect(@app.manage_organisation_page.first_organisation_name.text).to eq(organisation)
end

When("I choose to edit the organisation") do
  @app.manage_organisation_page.edit_organisation.click
end

When("I update the organisation's id code") do
  @app.edit_organisation_page.submit(id_code: "RMA001")
end

Then("I have successfully updated the organisation details") do
  expect(@app.manage_organisation_page.heading.text).to eq("Manage organisations")
end
