# Represents all pages in the application. Was created to avoid needing to
# create individual instances of each page throughout the steps.
# https://github.com/natritmeyer/site_prism#epilogue
# rubocop:disable Metrics/ClassLength
class App
  # Using an attr_reader automatically gives us a my_app.last_page method
  attr_reader :last_page, :base_page

  # FRONT OFFICE SPECIFIC PAGES
  # /
  def front_office_home_page
    @last_page = FrontOfficeHomePage.new
  end

  def login_page
    @last_page = LoginPage.new
  end

  def projects_page
    @last_page = ProjectsPage.new
  end

  def project_area_selection_page
    @last_page = ProjectAreaSelectionPage.new
  end

  def grant_in_aid_funding_page
    @last_page = GrantInAidFundingPage.new
  end

  def local_levy_funding_page
    @last_page = LocalLevyFundingPage.new
  end

  def project_name_page
    @last_page = ProjectNamePage.new
  end

  def project_type_page
    @last_page = ProjectTypePage.new
  end

  def project_year_page
    @last_page = ProjectYearPage.new
  end

  def project_year_alternative_page
    @last_page = ProjectYearAlternativePage.new
  end

  def proposal_overview_page
    @last_page = ProposalOverviewPage.new
  end

  def location_page
    @last_page = LocationPage.new
  end

  def benefit_area_file_page
    @last_page = BenefitAreaFilePage.new
  end

  def benefit_area_file_summary_page
    @last_page = BenefitAreaFileSummaryPage.new
  end

  def outline_business_case_start_date_page
    @last_page = OutlineBusinessCaseStartDatePage.new
  end

  def outline_business_case_completion_date_page
    @last_page = OutlineBusinessCaseCompletionDatePage.new
  end

  def award_contract_date_page
    @last_page = AwardContractDatePage.new
  end

  def start_construction_date_page
    @last_page = StartConstructionDatePage.new
  end

  def ready_for_service_date_page
    @last_page = ReadyForServiceDatePage.new
  end

  def funding_sources_page
    @last_page = FundingSourcesPage.new
  end

  def fcrm_funding_sources_page
    @last_page = FcrmFundingSourcesPage.new
  end

  def fcrm_gia_funding_sources_page
    @last_page = FcrmGiaFundingSourcesPage.new
  end

  def funding_values_page
    @last_page = FundingValuesPage.new
  end

  def contributer_funding_values_page
    @last_page = ContributerFundingValuesPage.new
  end

  def earliest_start_date_page
    @last_page = EarliestStartDatePage.new
  end

  def earlier_start_question_page
    @last_page = EarlierStartQuestionPage.new
  end

  def earlier_start_date_page
    @last_page = EarlierStartDatePage.new
  end

  def risks_page
    @last_page = RisksPage.new
  end

  def main_risk_page
    @last_page = MainRiskPage.new
  end

  def flood_protection_outcomes_page
    @last_page = FloodProtectionOutcomesPage.new
  end

  def flood_protection_outcomes_2040_page
    @last_page = FloodProtectionOutcomes2040Page.new
  end

  def coastal_erosion_protection_outcomes_page
    @last_page = CoastalErosionProtectionOutcomesPage.new
  end

  def standard_of_protection_page
    @last_page = StandardOfProtectionPage.new
  end

  def standard_of_protection_after_page
    @last_page = StandardOfProtectionAfterPage.new
  end

  def standard_of_protection_coastal_before_page
    @last_page = StandardOfProtectionCoastalBeforePage.new
  end

  def standard_of_protection_coastal_after_page
    @last_page = StandardOfProtectionCoastalAfterPage.new
  end

  def approach_page
    @last_page = ApproachPage.new
  end

  def environmental_outcomes_page
    @last_page = EnvironmentalOutcomesPage.new
  end

  def intertidal_habitat_page
    @last_page = IntertidalHabitatPage.new
  end

  def hectares_of_intertidal_habitat_page
    @last_page = HectaresOfIntertidalHabitatPage.new
  end

  def woodland_habitat_page
    @last_page = WoodlandHabitatPage.new
  end

  def wet_woodland_habitat_page
    @last_page = WetWoodlandHabitatPage.new
  end

  def wetland_habitat_page
    @last_page = WetlandHabitatPage.new
  end

  def grassland_habitat_page
    @last_page = GrasslandHabitatPage.new
  end

  def heathland_habitat_page
    @last_page = HeathlandHabitatPage.new
  end

  def lake_habitat_page
    @last_page = LakeHabitatPage.new
  end

  def arable_habitat_page
    @last_page = ArableHabitatPage.new
  end

  def hectares_of_woodland_habitat_page
    @last_page = HectaresOfWoodlandHabitatPage.new
  end

  def hectares_of_wet_woodland_habitat_page
    @last_page = HectaresOfWetWoodlandHabitatPage.new
  end

  def hectares_of_wetland_habitat_page
    @last_page = HectaresOfWetlandHabitatPage.new
  end

  def hectares_of_grassland_habitat_page
    @last_page = HectaresOfGrasslandHabitatPage.new
  end

  def hectares_of_heathland_habitat_page
    @last_page = HectaresOfHeathlandHabitatPage.new
  end

  def hectares_of_lake_habitat_page
    @last_page = HectaresOfLakeHabitatPage.new
  end

  def hectares_of_arable_habitat_page
    @last_page = HectaresOfArableHabitatPage.new
  end

  def comprehensive_restoration_habitat_page
    @last_page = ComprehensiveRestorationHabitatPage.new
  end

  def kilometers_of_comprehensive_restoration_habitat_page
    @last_page = KilometersOfComprehensiveRestorationHabitatPage.new
  end

  def partial_restoration_habitat_page
    @last_page = PartialRestorationHabitatPage.new
  end

  def kilometers_of_partial_restoration_habitat_page
    @last_page = KilometersOfPartialRestorationHabitatPage.new
  end

  def watercourse_habitat_page
    @last_page = WatercourseHabitatPage.new
  end

  def kilometers_of_watercourse_habitat_page
    @last_page = KilometersOfWatercourseHabitatPage.new
  end

  def improve_hbi_page
    @last_page = ImproveHbiPage.new
  end

  def remove_fish_barrier_page
    @last_page = RemoveFishBarrierPage.new
  end

  def remove_eel_barrier_page
    @last_page = RemoveEelBarrierPage.new
  end

  def fish_or_eel_amount_page
    @last_page = FishOrEelAmountPage.new
  end

  def urgency_page
    @last_page = UrgencyPage.new
  end

  def urgency_details_page
    @last_page = UrgencyDetailsPage.new
  end

  def funding_calculator_page
    @last_page = FundingCalculatorPage.new
  end

  def funding_calculator_summary_page
    @last_page = FundingCalculatorSummaryPage.new
  end

  def proposal_under_review_page
    @last_page = ProposalUnderReviewPage.new
  end

  def confirm_page
    @last_page = ConfirmPage.new
  end

  def click_and_continue
    @last_page = ClickAndContinue.new
  end

  def contributor_add_page
    @last_page = ContributorAddPage.new
  end

  def confidence_secured_partnership_funding_page
    @last_page = ConfidenceSecuredPartnershipFundingPage.new
  end

  def confidence_homes_by_gateway_four_page
    @last_page = ConfidenceHomesByGatewayFourPage.new
  end

  def confidence_homes_better_protected_page
    @last_page = ConfidenceHomesBetterProtectedPage.new
  end

  def carbon_cost_build_page
    @last_page = CarbonCostBuild.new
  end

  def carbon_cost_operation_page
    @last_page = CarbonCostOperationPage.new
  end

  def natural_flood_risk_measures_page
    @last_page = NaturalFloodRiskMeasuresPage.new
  end

  def natural_flood_risk_measures_question_page
    @last_page = NaturalFloodRiskMeasuresQuestionPage.new
  end

  def natural_flood_risk_measures_cost_page
    @last_page = NaturalFloodRiskMeasuresCostPage.new
  end

end
# rubocop:enable Metrics/ClassLength
