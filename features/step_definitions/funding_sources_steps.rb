# rubocop: disable Metrics/ParameterLists
Given(/^I enter a funding source for "([^"]*)"$/) do |funding_source|
  slug_fundingsource = {
    "grant_in_aid" => "fcerm_gia",
    "local_levy" => "local_levy",
    "public_sector" => "public_contributions",
    "private_sector" => "private_contributions",
    "other_sector" => "other_ea_contributions",
    "growth_funding" => "growth_funding",
    "internal_drainage_boards" => "internal_drainage_boards",
    "not_identified" => "not_yet_identified"
  }.freeze

  funding_source = slug_fundingsource[funding_source]

  @app.proposal_overview_page.add_funding_source.click
  @app.funding_sources_page.submit(
    funding_sources: [funding_source]
  )
end

Given(/^I enter funding values for single contributor "([^"]*)" previous year "([^"]*)", 2015-2016 "([^"]*)", 2016-2017 "([^"]*)", 2017-2018 "([^"]*)", 2018-2019 "([^"]*)", 2019-2020 "([^"]*)", 2020-2021 "([^"]*)", 2021-2022 "([^"]*)"$/) do |funding, previous, yr1516, yr1617, yr1718, yr1819, yr1920, yr2021, yr2022|
  slug_map = {
    "grant_in_aid" => "gia",
    "local_levy" => "levy",
    "public_sector" => "public",
    "private_sector" => "private",
    "other_sector" => "ea",
    "growth_funding" => "growth",
    "internal_drainage_boards" => "drain",
    "not_identified" => "notyet"
  }.freeze

  slug = slug_map[funding]

   # rubocop: disable Layout/CommentIndentation, Style/IdenticalConditionalBranches, Lint/MissingCopEnableDirective
  if %w[public private ea].include?(slug.to_s)
    @app.new_funding_values_page.send("#{slug}_current_year").set(previous)
    @app.new_funding_values_page.send("#{slug}_secure_current_year").click
    @app.new_funding_values_page.send("#{slug}_constrained_current_year").click
    @app.new_funding_values_page.send("#{slug}_2015_2016").set(yr1516)
    @app.new_funding_values_page.send("#{slug}_secure_2015_2016").click
    @app.new_funding_values_page.send("#{slug}_constrained_2015_2016").click
    @app.new_funding_values_page.send("#{slug}_2016_2017").set(yr1617)
    @app.new_funding_values_page.send("#{slug}_secure_2016_2017").click
    @app.new_funding_values_page.send("#{slug}_constrained_2016_2017").click
    @app.new_funding_values_page.send("#{slug}_2017_2018").set(yr1718)
    @app.new_funding_values_page.send("#{slug}_secure_2017_2018").click
    @app.new_funding_values_page.send("#{slug}_constrained_2017_2018").click
    @app.new_funding_values_page.send("#{slug}_2018_2019").set(yr1819)
    @app.new_funding_values_page.send("#{slug}_secure_2018_2019").click
    @app.new_funding_values_page.send("#{slug}_constrained_2018_2019").click
    @app.new_funding_values_page.send("#{slug}_2019_2020").set(yr1920)
    @app.new_funding_values_page.send("#{slug}_secure_2019_2020").click
    @app.new_funding_values_page.send("#{slug}_constrained_2019_2020").click
    @app.new_funding_values_page.send("#{slug}_2020_2021").set(yr2021)
    @app.new_funding_values_page.send("#{slug}_secure_2020_2021").click
    @app.new_funding_values_page.send("#{slug}_constrained_2020_2021").click
    @app.new_funding_values_page.send("#{slug}_2021_2022").set(yr2022)
    @app.new_funding_values_page.send("#{slug}_secure_2021_2022").click
    @app.new_funding_values_page.send("#{slug}_constrained_2021_2022").click
    @app.new_funding_values_page.submit_button.click
  else
    @app.new_funding_values_page.send("#{slug}_current_year").set(previous)
    @app.new_funding_values_page.send("#{slug}_2015_2016").set(yr1516)
    @app.new_funding_values_page.send("#{slug}_2016_2017").set(yr1617)
    @app.new_funding_values_page.send("#{slug}_2017_2018").set(yr1718)
    @app.new_funding_values_page.send("#{slug}_2018_2019").set(yr1819)
    @app.new_funding_values_page.send("#{slug}_2019_2020").set(yr1920)
    @app.new_funding_values_page.send("#{slug}_2020_2021").set(yr2021)
    @app.new_funding_values_page.send("#{slug}_2021_2022").set(yr2022)
    @app.new_funding_values_page.submit_button.click
  end
  # rubocop: enable Layout/CommentIndentation,, Style/IdenticalConditionalBranches, Lint/MissingCopEnableDirective
end

Given(/^I select secure funding for "([^"]*)"$/) do |selecton|
  @app.new_funding_values_page.submit(
    new_funding: selecton.to_sym
  )
end

Given(/^I enter a new sector contributor of "([^"]*)", "([^"]*)"$/) do |sector_source, contributor|
  sector_link = sector_source

  slug_map = {
    "public_sector" => "public",
    "private_sector" => "private",
    "other_sector" => "other"
  }.freeze

  source = slug_map[sector_source]

  @app.approach_page.submit(
    contributor: "This is the projects approach...."
  )

  @app.send("new_funding_#{sector_link}_contributors_page").send("new_#{source}_contributors_names").set(contributor)
  @app.send("new_funding_#{sector_link}_contributors_page").send("submit_button").click
end

Given(/^I enter two new sector contributors "([^"]*)", "([^"]*)", "([^"]*)"$/) do |sector_source, contributor1, contributor2|
  sector_link = sector_source

  slug_map = {
    "public_sector" => "public",
    "private_sector" => "private",
    "other_sector" => "other"
  }.freeze

  source = slug_map[sector_source]

  @app.approach_page.submit(
    contributor: "This is the projects approach...."
  )

  @app.send("new_funding_#{sector_link}_contributors_page").send("first_#{source}_contributors_names").set(contributor1)
  # click_on(class: 'add_element')
  @app.send("new_funding_#{sector_link}_contributors_page").send("add_another_contributor").click
  @app.send("new_funding_#{sector_link}_contributors_page").send("second_#{source}_contributors_names").set(contributor2)
  @app.send("new_funding_#{sector_link}_contributors_page").send("submit_button").click

end

Given(/^I enter new funding values for two contributors "([^"]*)" previous year "([^"]*)", 2015-2016 "([^"]*)", 2016-2017 "([^"]*)", 2017-2018 "([^"]*)", 2018-2019 "([^"]*)", 2019-2020 "([^"]*)", 2020-2021 "([^"]*)"$/) do |funding, previous, yr1516, yr1617, yr1718, yr1819, yr1920, yr2021|
  slug_map = {
    "grant_in_aid" => "gia",
    "local_levy" => "levy",
    "public_sector" => "public",
    "private_sector" => "private",
    "other_sector" => "ea",
    "growth_funding" => "growth",
    "internal_drainage_boards" => "drain",
    "not_identified" => "notyet"
  }.freeze

  slug = slug_map[funding]

  @app.new_funding_values_page.send("cont1_#{slug}_current_year").set(previous)
  @app.new_funding_values_page.send("cont1_#{slug}_2015_2016").set(yr1516)
  @app.new_funding_values_page.send("cont1_#{slug}_2016_2017").set(yr1617)
  @app.new_funding_values_page.send("cont1_#{slug}_2017_2018").set(yr1718)
  @app.new_funding_values_page.send("cont1_#{slug}_2018_2019").set(yr1819)
  @app.new_funding_values_page.send("cont1_#{slug}_2019_2020").set(yr1920)
  @app.new_funding_values_page.send("cont1_#{slug}_2020_2021").set(yr2021)
  @app.new_funding_values_page.send("cont1_#{slug}_2021_2022").set(yr2022)
  @app.new_funding_values_page.send("cont2_#{slug}_current_year").set(previous)
  @app.new_funding_values_page.send("cont2_#{slug}_2015_2016").set(yr1516)
  @app.new_funding_values_page.send("cont2_#{slug}_2016_2017").set(yr1617)
  @app.new_funding_values_page.send("cont2_#{slug}_2017_2018").set(yr1718)
  @app.new_funding_values_page.send("cont2_#{slug}_2018_2019").set(yr1819)
  @app.new_funding_values_page.send("cont2_#{slug}_2019_2020").set(yr1920)
  @app.new_funding_values_page.send("cont2_#{slug}_2020_2021").set(yr2021)
  @app.new_funding_values_page.send("cont2_#{slug}_2021_2022").set(yr2022)
  @app.new_funding_values_page.submit_button.click
  @app.new_funding_values_page.submit_button.click
end
# rubocop: enable

Given(/^I answer if the project could start sooner if grant in aid funding was made available earlier questions$/) do
  @app.proposal_overview_page.add_earliest_start.click
  @app.earliest_start_page.submit(
    earlier_start: true
  )
  @app.earliest_date_page.submit(
    month: "01",
    year: "2019"
  )
end

Given(/^I request Grant in Aid funding$/) do
  @app.grant_in_aid_funding_page.submit(
    grant_in_aid: true
  )
end

Given(/^I request Local Levy funding$/) do
  @app.local_levy_funding_page.submit(
    local_levy_funding: true
  )
end

When(/^I check the proposal overview page$/) do
  puts "Do nothing"
end

Then(/^I should see the total estimated spend as "([^"]*)"$/) do |totalspend|
  expect(@app.proposal_overview_page).to have_text(totalspend)
end
Then(/^I should see the funding source contributor "([^"]*)"$/) do |contributor|
  slug_contributor = {
    "grant_in_aid" => "Grant in aid",
    "local_levy" => "Local levy",
    "public_sector" => "public sector contributions",
    "private_sector" => "Private sector contributions",
    "other_sector" => "Contributions from other Environment Agency functions or sources",
    "growth_funding" => "Growth funding",
    "internal_drainage_boards" => "Funds recovered from an internal drainage board by the Environment Agency, known as a precept",
    "not_identified" => "Other funding sources not yet identified"
  }.freeze

  contributor_source = slug_contributor[contributor]
  expect(@app.proposal_overview_page).to have_text(contributor_source)
end

Given(/^I answer if the new project could start sooner if grant in aid funding was made available earlier questions$/) do
  @app.proposal_overview_page.add_earliest_start.click
  @app.earliest_start_page.submit(
    earlier_start: true
  )
  @app.earliest_date_page.submit(
    month: "01",
    year: "2019"
  )
end

Given(/^I request new Grant in Aid funding$/) do
  @app.grant_in_aid_funding_page.submit(
    grant_in_aid: true
  )
end

Given(/^I request new Local Levy funding$/) do
  @app.local_levy_funding_page.submit(
    local_levy_funding: true
  )
end

When(/^I check the new proposal overview page$/) do
  puts "Do nothing"
end

Then(/^I should see the new total estimated spend as "([^"]*)"$/) do |totalspend|
  expect(@app.proposal_overview_page).to have_text(totalspend)
end
Then(/^I should see the new funding source contributor "([^"]*)"$/) do |contributor|
  slug_contributor = {
    "grant_in_aid" => "Grant in aid",
    "local_levy" => "Local levy",
    "public_sector" => "public sector contributions",
    "private_sector" => "Private sector contributions",
    "other_sector" => "Contributions from other Environment Agency functions or sources",
    "growth_funding" => "Growth funding",
    "internal_drainage_boards" => "Funds recovered from an internal drainage board by the Environment Agency, known as a precept",
    "not_identified" => "Other funding sources not yet identified"
  }.freeze

  contributor_source = slug_contributor[contributor]
  expect(@app.proposal_overview_page).to have_text(contributor_source)
end

Given(/^I enter pp a sector contributor of "([^"]*)", "([^"]*)"$/) do |sector_source, contributor_name|
  sector_link = sector_source

  slug_map = {
    "public_sector" => "public",
    "private_sector" => "private",
    "other_sector" => "other"
  }.freeze

  source = slug_map[sector_source]

  @app.send("funding_#{sector_link}_contributors_page").send("#{source}_contributors_names").set(contributor_name)
  @app.send("funding_#{sector_link}_contributors_page").send("submit_button").click
end
Given(/^I enter pp funding values for a single contributor "([^"]*)" previous year "([^"]*)", 2015-2016 "([^"]*)", 2016-2017 "([^"]*)", 2017-2018 "([^"]*)", 2018-2019 "([^"]*)", 2019-2020 "([^"]*)", 2020-2021 "([^"]*)"$/) do |funding, previous, yr1516, yr1617, yr1718, yr1819, yr1920, yr2021|
  slug_map = {
    "grant_in_aid" => "gia",
    "local_levy" => "levy",
    "public_sector" => "public",
    "private_sector" => "private",
    "other_sector" => "ea",
    "growth_funding" => "growth",
    "internal_drainage_boards" => "drain",
    "not_identified" => "notyet"
  }.freeze

  slug = slug_map[funding]

  @app.funding_values_page.send("#{slug}_current_year").set(previous)
  @app.funding_values_page.send("#{slug}_2015_2016").set(yr1516)
  @app.funding_values_page.send("#{slug}_2016_2017").set(yr1617)
  @app.funding_values_page.send("#{slug}_2017_2018").set(yr1718)
  @app.funding_values_page.send("#{slug}_2018_2019").set(yr1819)
  @app.funding_values_page.send("#{slug}_2019_2020").set(yr1920)
  @app.funding_values_page.send("#{slug}_2020_2021").set(yr2021)
  @app.funding_values_page.submit_button.click
end
# rubocop: enable
# rubocop: enable Metrics/ParameterLists
