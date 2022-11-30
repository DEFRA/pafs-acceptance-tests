class ProposalOverviewPage < BasePage

  section(:user_bar, AdminUserBarSection, AdminUserBarSection::SELECTOR)

  element(:first_project, "tr:nth-child(1) td:nth-child(5)")

  element(:project_number, ".project-overview-head dd:nth-child(2)")
  element(:project_name, "#project-project_name-content p")
  element(:project_type, "#project-project_type-content p")
  element(:project_year, "#project-financial_year-content p")

  element(:add_location, "a[href$='/location']")
  element(:download_project_benefit_area, "a[href$='benefit_area']")

  element(:add_important_dates, "a[href$='/start_outline_business_case_date']")
  element(:add_funding_source, "a[href$='/funding_sources")
  element(:add_earliest_start, "a[href$='/earliest_start']")
  element(:add_risks, "a[href$='/risks']")
  element(:add_standard_of_protection, "a[href$='standard_of_protection']")
  element(:add_standard_of_coastal_protection, "a[href$='standard_of_protection_coastal']")
  element(:add_natural_flood_measures, "a[href$='/natural_flood_risk_measures_included']")
  element(:add_goals, "a[href$='/approach']")
  element(:add_environmental_outcomes, "a[href$='/any_environmental_benefits']")
  element(:add_project_urgency, "a[href$='/urgency']")
  element(:add_funding_calculator, "a[href$='/funding_calculator']")
  element(:add_confidence, "a[href$='/confidence_homes_better_protected']")
  element(:add_carbon, "a[href$='/carbon_cost_build']")

  # Funding sources and spending
  element(:gia_funding_total, "#funding-grant-in-aid")
  element(:local_levy_funding_total, "#funding-local-levy")
  element(:additional_gia_funding_total, "#funding-additional-grant-in-aid")
  element(:public_sector_funding_total, "#funding-public-sector-contributions")
  element(:private_sector_funding_total, "#funding-private-sector-contributions")
  element(:other_funding_total, "#funding-contributions-from-other-environment-agency-functions-or-sources")
  element(:internal_drainage_board_funding_total, "[id^='funding-funds-recovered-from-an-internal-drainage'")
  element(:not_yet_identified_funding_total, "#funding-other-funding-sources-not-yet-identified")

  element(:natural_flood_measures_section, "#project-natural_flood_risk_measures-field")
  element(:project_risks_section, "#project-risks .summary-list")

  element(:environmental_outcomes_section, "#project-environmental_outcomes-field")
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
