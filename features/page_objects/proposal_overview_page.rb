class ProposalOverviewPage < BasePage

  section(:user_bar, AdminUserBarSection, AdminUserBarSection::SELECTOR)

  element(:first_project, "tr:nth-child(1) td:nth-child(5)")

  element(:project_number, ".project-overview-head dd:nth-child(2)")
  element(:project_name, "#project-project_name-content p")
  element(:project_type, "#project-project_type-content p")
  element(:project_year, "#project-financial_year-content p")

  element(:add_location, "#project-location-content a")
  element(:download_project_benefit_area, "a[href$='benefit_area']")

  element(:add_important_dates, "#project-key_dates-content a")
  element(:add_funding_source, "#project-funding_sources-content a")
  element(:add_earliest_start, "#project-earliest_start-content a")
  element(:add_risks, "#project-risks-content a")
  element(:add_standard_of_protection, "a[href$='standard_of_protection']")
  element(:add_standard_of_coastal_protection, "a[href$='standard_of_protection_coastal']")
  element(:add_natural_flood_measures, "a[href$='natural_flood_risk_measures_included']")
  element(:add_goals, "#project-approach-content a")
  element(:add_environmental_outcomes, "#project-environmental_outcomes-content a")
  element(:add_project_urgency, "#project-urgency-content a")
  element(:add_funding_calculator, "#project-funding_calculator-content a")
  element(:add_confidence, "#project-confidence-content a")
  element(:add_carbon, "#project-carbon-content a")

  # Funding sources and spending
  element(:gia_funding_total, "#funding-grant-in-aid")
  element(:local_levy_funding_total, "#funding-local-levy")
  element(:additional_gia_funding_total, "#funding-additional-grant-in-aid")
  element(:public_sector_funding_total, "#funding-public-sector-contributions")
  element(:private_sector_funding_total, "#funding-private-sector-contributions")
  element(:other_funding_total, "#funding-contributions-from-other-environment-agency-functions-or-sources")
  element(:internal_drainage_board_funding_total, "[id^='funding-funds-recovered-from-an-internal-drainage'")
  element(:not_yet_identified_funding_total, "#funding-other-funding-sources-not-yet-identified")

  element(:natural_flood_measures_section, "#project-natural_flood_risk_measures-content")
  element(:project_risks_section, "#project-risks-content .summary-list")

  element(:environmental_outcomes_section, "#project-environmental_outcomes-content")
  element(:wetland_habitat_total, "#hectares_of_intertidal_habitat_created_or_enhanced")
  element(:woodland_habitat_total, "#hectares_of_woodland_habitat_created_or_enhanced")
  element(:wet_woodland_habitat_total, "#hectares_of_wet_woodland_habitat_created_or_enhanced")
  element(:wet_grassland_habitat_total, "#hectares_of_wetland_or_wet_grassland_created_or_enhanced")
  element(:grassland_habitat_total, "#hectares_of_grassland_habitat_created_or_enhanced")
  element(:heathland_habitat_total, "#hectares_of_heathland_created_or_enhanced")
  element(:lake_habitat_total, "#hectares_of_pond_or_lake_habitat_created_or_enhanced")
  element(:arable_habitat_total, "#hectares_of_arable_land_lake_habitat_created_or_enhanced")
  element(:comprehensive_restoration_habitat_total, "#kilometres_of_watercourse_enhanced_or_created_comprehensive")
  element(:partial_restoration_habitat_total, "#kilometres_of_watercourse_enhanced_or_created_partial")
  element(:watercourse_habitat_total, "#kilometres_of_watercourse_enhanced_or_created_single")

  element(:revert_to_draft, "#[href$='Revert to draft']")

  element(:complete_proposal, "[href$='complete']")

  element(:submit_proposal, "a[href$='submit']", visible: false)

  element(:pso_complete_proposal, "a[href$='submit']")
  element(:pso_unlock_proposal, "a[href$='unlock']")

  def find_project_link(page_source)
    click_link(page_source)
  end

  def find_project_button(page_source)
    click_button(page_source)
  end

  def return_to_proposal_overview(link_name)
    click_link(link_name)
  end

end
