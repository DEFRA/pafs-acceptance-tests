Given(/^I sign in as a "([^"]*)" user$/) do |user_type|
  @app = App.new
  @app.front_office_home_page.load
  choose_cookie_option
  @user_type = user_type
  @app.login_page.submit(
    email: Quke::Quke.config.custom["user_accounts"][user_type]["username"],
    password: ENV["PAFS_DEFAULT_PASSWORD"]
  )
end

Given(/^I create a new "([^"]*)" project$/) do |action|
  @app.projects_page.create_proposal.click
  newname = "Functional_Test_Project_Name_#{Time.now.to_i}"
  puts newname
  @app.project_name_page.submit(
    project_name: newname.to_sym
  )
  @app.project_area_selection_page.select_first_area if @user_type == "pso"
  @app.project_type_page.submit(
    option: action
  )
end

Given(/^I create a new proposal$/) do
  @app.projects_page.create_proposal.click
end

Given(/^I select an existing proposal$/) do
  @app.proposal_overview_page.first_project.click
end

Given(/^I enter a new project name$/) do
  newname = "Functional_Test_Project_Name_#{Time.now.to_i}"
  puts newname
  @app.project_name_page.submit(
    project_name: newname.to_sym
  )
end

Given(/^I enter a project name "([^"]*)"$/) do |project_name|
  @app.project_name_page.submit(
    project_name: project_name.to_sym
  )
end

Given(/^I select a project area "([^"]*)"$/) do |area_source|
  @app.project_area_selection_page.submit(
    areasource: area_source
  )
end

Given(/^I select a financial year to stop spending$/) do
  current_year = Time.now.year
  next_year = current_year + 1
  @app.project_year_page.submit(
    option: next_year
  )
end

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

Given(/^I enter a business case start date$/) do
  @app.proposal_overview_page.add_important_dates.click
  @app.start_outline_business_case_date_page.submit(
    month: "01",
    year: "2020"
  )
end

Given(/^I enter an award contract date$/) do
  @app.award_contract_date_page.submit(
    month: "01",
    year: "2021"
  )
end

Given(/^I enter a construction start date$/) do
  @app.start_construction_date_page.submit(
    month: "01",
    year: "2022"
  )
end

Given(/^I enter a ready for service date$/) do
  @app.ready_for_service_date_page.submit(
    month: "01",
    year: "2023"
  )
end

Given(/^I return to the overview page$/) do
  @app.proposal_under_review_page.return_to_the_proposal_overview_page.click
end

Given(/^I revert to draft$/) do
  @app.proposal_overview_page.revert_to_draft.click
end

Given(/^I add the standard of protection before project starts as "([^"]*)"$/) do |before|
  @app.proposal_overview_page.add_standard_of_protection.click
  @app.standard_of_protection_page.submit(
    option: before.to_sym
  )
end

Given(/^I add the standard of protection after project completes as "([^"]*)"$/) do |after|
  @app.standard_of_protection_after_page.submit(
    option: after.to_sym
  )
end

Given(/^I add the standard of protection coastal erosion starts as "([^"]*)"$/) do |before|
  @app.standard_of_protection_coastal_before_page.submit(
    option: before.to_sym
  )
end

Given(/^I add the standard of protection before coastal erosion starts as "([^"]*)"$/) do |before|
  @app.proposal_overview_page.add_standard_of_coastal_protection.click
  @app.standard_of_protection_coastal_before_page.submit(
    option: before.to_sym
  )
end

Given(/^I add the standard of protection after coastal erosion project completes as "([^"]*)"$/) do |after|
  @app.standard_of_protection_coastal_after_page.submit(
    option: after.to_sym
  )
end

Given(/^I enter the projects goal approach "([^"]*)"$/) do |msg|
  @app.proposal_overview_page.add_goals.click
  @app.approach_page.submit(
    approach: msg.to_sym
  )
end

Given("I click and continue") do
  @app.front_office_home_page.submit_button.click
end

Given(/^I answer YES if the project could start sooner "([^"]*)", "([^"]*)"$/) do |month, year|
  @app.proposal_overview_page.add_earliest_start.click
  @app.earliest_start_page.submit(
    earlier_start: true
  )
  @app.earliest_date_page.submit(
    month: month.to_sym,
    year: year.to_sym
  )
end

Given("I answer NO if the project could start sooner") do
  @app.proposal_overview_page.add_earliest_start.click
  @app.earliest_start_page.submit(
    earlier_start: false
  )
end

When(/^I select the (.*) task$/) do |task|
  case task
  when "funding calculator"
    @app.proposal_overview_page.add_funding_calculator.click
  when "natural flood measures"
    @app.proposal_overview_page.add_natural_flood_measures.click
  when "environmental benefit outcomes"
    @app.proposal_overview_page.add_environmental_outcomes.click
  when "project risks"
    @app.proposal_overview_page.add_risks.click
  end
end

When("I confirm the Outline Business Case be signed off after the 26th June 2020") do
  @app.funding_calculator_page.signed_off_after.click
  expect(@app.funding_calculator_page).to have_funding_calculator_2020_link
end

Given(/^I sign out of the proposal$/) do
  @app.projects_page.user_bar.sign_out_link.click
end

Given(/^I search for an existing proposal$/) do
  expect(@app.proposal_overview_page).to have_text(@project_number)
  @app.proposal_overview_page.find_project_link(@project_number)
end

Given(/^I submit my proposal$/) do
  @project_number = @app.proposal_overview_page.project_number.text
  @app.proposal_overview_page.submit_proposal.click
end

Then("I should see that my proposal is sent for review") do
  expect(@app.confirm_page).to have_project_number
  @project_number = @app.confirm_page.project_number.text
  expect(@app.confirm_page).to have_text("Proposal sent for review")
end

Given(/^its status is draft$/) do
  @status = @app.proposal_overview_page.first_project.text
  expect(@app.proposal_overview_page.first_project.text).to eq "Draft"
end
