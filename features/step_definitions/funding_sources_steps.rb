Given(/^I enter funding sources? "([^"]*)"$/) do |funding_source|
  @app.proposal_overview_page.add_funding_source.click
  @fcrm_funding_sources = []
  @funding_sources = []
  funding_source.split.each do |source|
    slug_fundingsource = {
      "grant_in_aid" => "fcerm-gia",
      "local_levy" => "local-levy",
      "public_sector" => "public-contributions",
      "private_sector" => "private-contributions",
      "other_sector" => "other-ea-contributions",
      "fcrm_gia" => "growth-funding",
      "internal_drainage_boards" => "internal-drainage-boards",
      "not_identified" => "not-yet-identified"
    }.freeze
    @funding_sources << slug_fundingsource[source]
    @app.funding_sources_page.submit(
      funding_sources: slug_fundingsource[source]
    )
  end
  @app.funding_sources_page.submit_button.click
end

Given(/^I enter FCRM grant in aid funding sources? "([^"]*)"$/) do |funding_source|
  @fcrm_funding_sources = []
  funding_source.split.each do |source|
    slug_fundingsource = {
      "asset_replacement" => "asset-replacement-allowance",
      "environment_statutory" => "environment-statutory-funding",
      "frequently_flooded_communities" => "frequently-flooded-communities",
      "other_gia" => "other-additional-grant-in-aid",
      "other_gov" => "other-government-department",
      "recovery" => "recovery",
      "summer_economic" => "summer-economic-fund"
    }.freeze
    @fcrm_funding_sources << slug_fundingsource[source]
    @app.fcrm_funding_sources_page.submit(
      funding_sources: slug_fundingsource[source]
    )
  end
  @app.fcrm_funding_sources_page.submit_button.click
end

Given("I enter funding source contributors and values") do
  if @funding_sources.include?("public-contributions")
    @app.contributor_add_page.submit
    @app.contributer_funding_values_page.submit(funding: :last_year)
    @public_contributions_total = @app.contributer_funding_values_page.grand_total.text
    @app.contributer_funding_values_page.submit_button.click
  end
  if @funding_sources.include?("private-contributions")
    @app.contributor_add_page.submit
    @app.contributer_funding_values_page.submit(funding: :last_year)
    @private_contributions_total = @app.contributer_funding_values_page.grand_total.text
    @app.contributer_funding_values_page.submit_button.click
  end
  if @funding_sources.include?("other-ea-contributions")
    @app.contributor_add_page.submit
    @app.contributer_funding_values_page.submit(funding: :last_year)
    @other_contributions_total = @app.contributer_funding_values_page.grand_total.text
    @app.contributer_funding_values_page.submit_button.click
  end
  @app.funding_values_page.fill_last_year_random(funding: :gia) if @funding_sources.include?("fcerm-gia")

  @app.funding_values_page.fill_last_year_random(funding: :local_levy) if @funding_sources.include?("local-levy")

  if @funding_sources.include?("internal-drainage-boards")
    @app.funding_values_page.fill_last_year_random(funding: :internal_drainage_boards)
  end
  if @funding_sources.include?("not-yet-identified")
    @app.funding_values_page.fill_last_year_random(funding: :not_yet_identified)
  end

  # If FCRM funding option isn't selected, skip this section
  unless @fcrm_funding_sources.nil?
    if @fcrm_funding_sources.include?("environment-statutory-funding")
      @app.funding_values_page.fill_last_year_random(funding: :environment_stat)
    end
    if @fcrm_funding_sources.include?("frequently-flooded-communities")
      @app.funding_values_page.fill_last_year_random(funding: :freq_flood)
    end
    if @fcrm_funding_sources.include?("other-additional-grant-in-aid")
      @app.funding_values_page.fill_last_year_random(funding: :other_gia)
    end
    if @fcrm_funding_sources.include?("other-government-department")
      @app.funding_values_page.fill_last_year_random(funding: :other_gov)
    end
    if @fcrm_funding_sources.include?("summer-economic-fund")
      @app.funding_values_page.fill_last_year_random(funding: :summer_economic)
    end
    @app.funding_values_page.fill_last_year_random(funding: :recovery) if @fcrm_funding_sources.include?("recovery")
    if @fcrm_funding_sources.include?("asset-replacement-allowance")
      @app.funding_values_page.fill_last_year_random(funding: :asset_replacement)
    end

  end
  # takes focus off last cell to start total calculation
  @app.funding_values_page.grand_total.click
  sleep 2
  if @funding_sources.include?("fcerm-gia")
    @fcerm_gia_contributions_total = @app.funding_values_page.gia_funding_total.text
  end

  if @funding_sources.include?("local-levy")
    @local_levy_contributions_total = @app.funding_values_page.local_levy_funding_total.text
  end

  if @funding_sources.include?("public-sector")
    @internal_drainage_board_funding_total = @app.funding_values_page.public_funding_total.text
  end
  if @funding_sources.include?("not-yet-identified")
    @not_yet_identified_funding_total = @app.funding_values_page.not_yet_identified_funding_total.text
  end

  if @funding_sources.include?("local-levy")
    @local_levy_funding_total = @app.funding_values_page.local_levy_funding_total.text
  end

  if @fcrm_funding_sources.include?("environment-statutory-funding")
    @environment_statutory_funding_total = @app.funding_values_page.environment_statutory_funding_total.text
  end
  if @fcrm_funding_sources.include?("frequently-flooded-communities")
    @frequently_flooded_communities_total = @app.funding_values_page.frequently_flooded_communities_total.text
  end
  if @fcrm_funding_sources.include?("other-additional-grant-in-aid")
    @other_additional_grant_in_aid_total = @app.funding_values_page.other_additional_grant_in_aid_total.text
  end
  if @fcrm_funding_sources.include?("other-government-department")
    @other_government_department_total = @app.funding_values_page.other_government_department_total.text
  end
  if @fcrm_funding_sources.include?("summer-economic-fund")
    @summer_economic_fund_total = @app.funding_values_page.summer_economic_fund_total.text
  end
  @recovery_total = @app.funding_values_page.recovery_total.text if @fcrm_funding_sources.include?("recovery")
  if @fcrm_funding_sources.include?("asset-replacement-allowance")
    @asset_replacement_allowance_total = @app.funding_values_page.asset_replacement_allowance_total.text
  end
  @last_year_total = @app.funding_values_page.year_totals.last.text
  puts @last_year_total
  @app.funding_values_page.submit_button.click
end

When("I enter funding values of {int}") do |value|
  @app.funding_values_page.fill_last_year(funding: :internal_drainage_boards, amount: value)
  @last_year_total = @app.funding_values_page.year_totals.last.text
  @app.funding_values_page.submit_button.click
end

When("I enter grant_in_aid funds for all available years") do
  @app.funding_values_page.fill_random(funding: :gia)
  @app.funding_values_page.submit_button.click
end

When("I enter grant_in_aid funds for the first available year") do
  @app.funding_values_page.fill_first_year_random(funding: :gia)
  @app.funding_values_page.submit_button.click
end

Given("I enter a new sector contributor") do
  @app.contributor_add_page.submit
end

Then("I can see the funding sources and values in the proposal overview") do
  if @funding_sources.include?("public_contributions")
    expect(@app.proposal_overview_page.public_sector_funding_total).to have_text(convert_to_currency_format(@public_contributions_total))
  end
  if @funding_sources.include?("fcerm_gia")
    expect(@app.proposal_overview_page.gia_funding_total).to have_text(@fcerm_gia_contributions_total)
  end
  if @funding_sources.include?("local_levy")
    expect(@app.proposal_overview_page.local_levy_funding_total).to have_text(@local_levy_contributions_total)
  end
  if @funding_sources.include?("private_contributions")
    expect(@app.proposal_overview_page.private_sector_funding_total).to have_text(convert_to_currency_format(@private_contributions_total))
  end
  if @funding_sources.include?("other_ea_contributions")
    expect(@app.proposal_overview_page.other_funding_total).to have_text(convert_to_currency_format(@other_contributions_total))
  end
  if @funding_sources.include?("internal_drainage_boards")
    expect(@app.proposal_overview_page.internal_drainage_board_funding_total).to have_text(@internal_drainage_board_funding_total)
  end
  if @funding_sources.include?("not_yet_identified")
    expect(@app.proposal_overview_page.not_yet_identified_funding_total).to have_text(@not_yet_identified_funding_total)
  end

  if @fcrm_funding_sources.include?("environment-statutory-funding")
    expect(@app.proposal_overview_page.environment_statutory_funding_total).to have_text(@environment_statutory_funding_total)
  end
  if @fcrm_funding_sources.include?("frequently-flooded-communities")
    expect(@app.proposal_overview_page.frequently_flooded_communities_total).to have_text(@frequently_flooded_communities_total)
  end
  if @fcrm_funding_sources.include?("other-additional-grant-in-aid")
    expect(@app.proposal_overview_page.other_additional_grant_in_aid_total).to have_text(@other_additional_grant_in_aid_total)
  end
  if @fcrm_funding_sources.include?("other-government-department")
    expect(@app.proposal_overview_page.other_government_department_total).to have_text(@other_government_department_total)
  end
  if @fcrm_funding_sources.include?("summer-economic-fund")
    expect(@app.proposal_overview_page.summer_economic_fund_total).to have_text(@summer_economic_fund_total)
  end
  if @fcrm_funding_sources.include?("recovery")
    expect(@app.proposal_overview_page.recovery_total).to have_text(@recovery_total)
  end
  if @fcrm_funding_sources.include?("asset-replacement-allowance")
    expect(@app.proposal_overview_page.asset_replacement_allowance_total).to have_text(@asset_replacement_allowance_total)
  end
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

Then("I can see the last financial year to stop spending is the last year in the funding table") do
  expect(@app.funding_values_page.financial_years.last).to have_text(@last_year)
end
