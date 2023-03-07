Given("I search for a project") do
  @app.projects_page.show_all_projects.click
  puts @app.projects_page.project_links.last.text
  @project_number = @app.projects_page.project_links.last.text
  @app.projects_page.submit(project_number: @project_number)
end

Then("I can see the project in the search results") do
  expect(@app.projects_page.project_links.first).to have_text(@project_number)
end
