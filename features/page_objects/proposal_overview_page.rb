class ProposalOverviewPage < SitePrism::Page

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

  element(:add_goals, "#project-approach-content a")
  element(:add_environmental_outcomes, "#project-environmental_outcomes-content a")
  element(:add_project_urgency, "#project-urgency-content a")
  element(:add_funding_calculator, "#project-funding_calculator-content a")

  element(:revert_to_draft, "#[href$='Revert to draft']")

  # Based on PM-529 this has been changed fromn complete to submit
  # This is only on the Training site at the moment
  element(:complete_proposal_training, "a[href$='submit']")
  element(:complete_proposal, "a[href$='complete']")

  def submit(_args = {})
    search_button.click
  end

end
