Given(/^I upload the benefit area file "([^"]*)"$/) do |filename|
  @app.benefit_area_file_page.submit(
    file: filename
  )
end

Then(/^I should see the message "([^"]*)" on the benefit area page$/) do |message|
  expect(@app.benefit_area_file_summary_page).to have_text(message)
end

Then(/^I should see the message "([^"]*)" on the benefit file page$/) do |message|
  expect(@app.benefit_area_file_page).to have_text(message)
end
