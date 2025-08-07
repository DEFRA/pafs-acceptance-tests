Given(/^I sign in as a "([^"]*)" user$/) do |user_type|
  @app = App.new
  @app.front_office_home_page.load
  choose_cookie_option
  @user_type = user_type
  @app.login_page.submit(
    email: Quke::Quke.config.custom["user_accounts"][user_type]["username"],
    password: ENV.fetch("PAFS_DEFAULT_PASSWORD", nil)
  )
end

Given(/^I create a new "([^"]*)" project$/) do |action|
  @app.projects_page.create_proposal.click
  @project_name = "Functional_Test_Project_Name_#{Time.now.to_i}"
  puts @project_name
  @app.project_name_page.submit(
    project_name: @project_name.to_sym
  )

  @app.project_area_selection_page.select_first_area if @user_type == "pso"
  @app.project_type_page.submit(
    option: action
  )
end

Given(/^I create a new proposal$/) do
  @app.projects_page.create_proposal.click
end

Given(/^I enter a new project name$/) do
  @project_name = "Functional_Test_Project_Name_#{Time.now.to_i}"
  puts @project_name
  @app.project_name_page.submit(
    project_name: @project_name.to_sym
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
  next_year = current_year + 3
  @app.project_year_page.submit(
    option: next_year
  )
  puts current_url
end

When("I select a financial year to stop spending as {string}") do |last_year|
  @last_year = last_year
  @app.project_year_page.later_year.click
  @app.project_year_alternative_page.submit(year: @last_year)
end

Given("I enter a business case start date") do
  @app.proposal_overview_page.add_important_dates.click
  @business_case_start_date_month = 1
  @business_case_start_date_year = Time.now.year + 1
  @app.outline_business_case_start_date_page.submit(
    month: @business_case_start_date_month,
    year: @business_case_start_date_year
  )
end

Given("I enter a business case completion date") do
  @business_case_completion_date_month = 2
  @business_case_completion_date_year = Time.now.year + 1
  @app.outline_business_case_completion_date_page.submit(
    month: @business_case_completion_date_month,
    year: @business_case_completion_date_year
  )
end

Given("I enter an award contract date") do
  @award_contract_date_month = 3
  @award_contract_date_year = Time.now.year + 1
  @app.award_contract_date_page.submit(
    month: @award_contract_date_month,
    year: @award_contract_date_year
  )
end

Given("I enter a construction start date") do
  @construction_start_date_month = 4
  @construction_start_date_year = Time.now.year + 1
  @app.start_construction_date_page.submit(
    month: @construction_start_date_month,
    year: @construction_start_date_year
  )
end

Given("I enter a ready for service date") do
  @ready_for_service_date_month = 5
  @ready_for_service_date_year = Time.now.year + 1
  @app.ready_for_service_date_page.submit(
    month: @ready_for_service_date_month,
    year: @ready_for_service_date_year
  )
end

When("I enter the ready for service date as {string}") do |year|
  @app.proposal_overview_page.add_important_dates.click
  @app.outline_business_case_start_date_page.submit(
    month: 1,
    year: year
  )
  @app.outline_business_case_completion_date_page.submit(
    month: 2,
    year: year
  )
  @app.award_contract_date_page.submit(
    month: 3,
    year: year
  )
  @app.start_construction_date_page.submit(
    month: 4,
    year: year
  )
  @app.ready_for_service_date_page.submit(
    month: 5,
    year: year
  )
end

Given("I enter important project dates") do
  @app.proposal_overview_page.add_important_dates.click
  @app.outline_business_case_start_date_page.submit(
    month: 1,
    year: Time.now.year + 1
  )

  @app.outline_business_case_completion_date_page.submit(
    month: 2,
    year: Time.now.year + 1
  )

  @app.award_contract_date_page.submit(
    month: 3,
    year: Time.now.year + 1
  )

  @app.start_construction_date_page.submit(
    month: 4,
    year: Time.now.year + 1
  )

  @app.ready_for_service_date_page.submit(
    month: 5,
    year: Time.now.year + 1
  )
end

Given("I return to the overview page") do
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

Given("I answer the earliest start date section") do
  @app.proposal_overview_page.add_earliest_start.click
  @app.earliest_start_date_page.submit(
    month: 1,
    year: Time.now.year + 1
  )
  @app.earlier_start_question_page.submit(
    earlier_start: true
  )
  @app.earlier_start_date_page.submit(
    month: Time.now.month + 1,
    year: Time.now.year
  )
end

Given("I answer the earliest start date as {string}") do |year|
  @app.proposal_overview_page.add_earliest_start.click
  @app.earliest_start_date_page.submit(
    month: 1,
    year: year
  )
  @app.earlier_start_question_page.submit(
    earlier_start: false
  )
end

Given("I answer the earliest start date as after next year") do
  @app.proposal_overview_page.add_earliest_start.click
  @app.earliest_start_date_page.submit(
    month: 1,
    year: Time.now.year + 2
  )
  @app.earlier_start_question_page.submit(
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
  @app.confirm_page.return_to_proposals.click
end

Given(/^its status is (.*)$/) do |status|
  expect(@app.projects_page.first_project_name.text).to eq @project_name
  @status = @app.projects_page.first_project_status.text
  expect(@app.projects_page.first_project_status.text).to eq status
end

Then("I should be informed {string}") do |message|
  expect(@app.confirm_page).to have_text(message)
end

Then("I should see the partnership funding calculator section") do
  expect(@app.proposal_overview_page).to have_partnership_funding_calculator
end

Then("I should not see the partnership funding calculator section") do
  expect(@app.proposal_overview_page).not_to have_partnership_funding_calculator
end
