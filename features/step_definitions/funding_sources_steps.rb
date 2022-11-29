Given(/^I enter funding sources? "([^"]*)"$/) do |funding_source|
  @app.proposal_overview_page.add_funding_source.click
  @funding_sources = []
  funding_source.split.each do |source|
    slug_fundingsource = {
      "grant_in_aid" => "fcerm-gia",
      "local_levy" => "local-levy",
      "public_sector" => "public-contributions",
      "private_sector" => "private-contributions",
      "other_sector" => "other-ea-contributions",
      "growth_funding" => "growth-funding",
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

Given("I enter funding source contributors and values") do
  if @funding_sources.include?("public-contributions")
    @app.contributor_add_page.submit
    @app.contributer_funding_values_page.submit(funding: :random)
    @public_contributions_total = @app.contributer_funding_values_page.grand_total.text
    @app.contributer_funding_values_page.submit_button.click
  end
  if @funding_sources.include?("private-contributions")
    @app.contributor_add_page.submit
    @app.contributer_funding_values_page.submit(funding: :random)
    @private_contributions_total = @app.contributer_funding_values_page.grand_total.text
    @app.contributer_funding_values_page.submit_button.click
  end
  if @funding_sources.include?("other-ea-contributions")
    @app.contributor_add_page.submit
    @app.contributer_funding_values_page.submit(funding: :random)
    @other_contributions_total = @app.contributer_funding_values_page.grand_total.text
    @app.contributer_funding_values_page.submit_button.click
  end
  @app.funding_values_page.submit(funding: :gia) if @funding_sources.include?("fcerm-gia")

  @app.funding_values_page.submit(funding: :local_levy) if @funding_sources.include?("local-levy")

  @app.funding_values_page.submit(funding: :additional_grant_in_aid) if @funding_sources.include?("growth-funding")

  if @funding_sources.include?("internal-drainage-boards")
    @app.funding_values_page.submit(funding: :internal_drainage_boards)
  end
  @app.funding_values_page.submit(funding: :not_yet_identified) if @funding_sources.include?("not-yet-identified")
  # takes focus off last cell to start total calculation
  @app.funding_values_page.grand_total.click
  sleep 2
  if @funding_sources.include?("fcerm-gia")
    @fcerm_gia_contributions_total = @app.funding_values_page.gia_funding_total.text
  end

  if @funding_sources.include?("local-levy")
    @local_levy_contributions_total = @app.funding_values_page.local_levy_funding_total.text
  end

  if @funding_sources.include?("growth-funding")
    @additional_gia_contributions_total = @app.funding_values_page.growth_funding_total.text
  end

  if @funding_sources.include?("public-sector")
    @internal_drainage_board_funding_total = @app.funding_values_page.public_funding_total.text
  end
  if @funding_sources.include?("not-yet-identified")
    @not_yet_identified_funding_total = @app.funding_values_page.private_funding_total.text
  end

  if @funding_sources.include?("local-levy")
    @local_levy_funding_total = @app.funding_values_page.local_levy_funding_total.text
  end

  if @funding_sources.include?("growth-funding")
    @additional_gia_contributions_total = @app.funding_values_page.growth_funding_total.text
  end

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
  if @funding_sources.include?("growth_funding")
    expect(@app.proposal_overview_page.additional_gia_funding_total).to have_text(@additional_gia_contributions_total)
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
