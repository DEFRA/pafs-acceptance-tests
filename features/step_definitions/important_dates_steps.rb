Then("I can see the important dates in the proposal overview") do
  expect(@app.proposal_overview_page.businesss_case_start_date).to have_text presentable_date(@business_case_start_date_month, @business_case_start_date_year)
  expect(@app.proposal_overview_page.businesss_case_completion_date).to have_text presentable_date(@business_case_completion_date_month, @business_case_completion_date_year)
  expect(@app.proposal_overview_page.contract_awarded_date).to have_text presentable_date(@award_contract_date_month, @award_contract_date_year)
  expect(@app.proposal_overview_page.construction_start_date).to have_text presentable_date(@construction_start_date_month, @construction_start_date_year)
  expect(@app.proposal_overview_page.ready_for_service_date).to have_text presentable_date(@ready_for_service_date_month, @ready_for_service_date_year)

end
