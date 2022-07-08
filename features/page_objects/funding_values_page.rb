# rubocop: disable Metrics/ClassLength
class FundingValuesPage < BasePage

  section(:user_bar, AdminUserBarSection, AdminUserBarSection::SELECTOR)

  # rubocop:disable Style/MutableConstant
  COMMON_SELECTOR = "funding_values_step_funding_values_attributes"
  COMMON_SELECTOR_PUBLIC = "public_contributor_values_step_funding_contributors_attributes"
  COMMON_SELECTOR_PRIVATE = "private_contributor_values_step_funding_contributors_attributes"
  COMMON_SELECTOR_OTHER = "other_ea_contributor_values_step_funding_contributors_attributes"

  element(:gia_current_year, "##{COMMON_SELECTOR}_0_fcerm_gia")
  element(:gia_2015_2016, "##{COMMON_SELECTOR}_1_fcerm_gia")
  element(:gia_2016_2017, "##{COMMON_SELECTOR}_2_fcerm_gia")
  element(:gia_2017_2018, "##{COMMON_SELECTOR}_3_fcerm_gia")
  element(:gia_2018_2019, "##{COMMON_SELECTOR}_4_fcerm_gia")
  element(:gia_2019_2020, "##{COMMON_SELECTOR}_5_fcerm_gia")
  element(:gia_2020_2021, "##{COMMON_SELECTOR}_6_fcerm_gia")
  element(:gia_2021_2022, "##{COMMON_SELECTOR}_7_fcerm_gia")

  element(:levy_current_year, "##{COMMON_SELECTOR}_0_local_levy")
  element(:levy_2015_2016, "##{COMMON_SELECTOR}_1_local_levy")
  element(:levy_2016_2017, "##{COMMON_SELECTOR}_2_local_levy")
  element(:levy_2017_2018, "##{COMMON_SELECTOR}_3_local_levy")
  element(:levy_2018_2019, "##{COMMON_SELECTOR}_4_local_levy")
  element(:levy_2019_2020, "##{COMMON_SELECTOR}_5_local_levy")
  element(:levy_2020_2021, "##{COMMON_SELECTOR}_6_local_levy")
  element(:levy_2021_2022, "##{COMMON_SELECTOR}_7_local_levy")

  element(:public_current_year, "##{COMMON_SELECTOR_PUBLIC}_0_amount")
  element(:public_2015_2016, "##{COMMON_SELECTOR_PUBLIC}_1_amount")
  element(:public_2016_2017, "##{COMMON_SELECTOR_PUBLIC}_2_amount")
  element(:public_2017_2018, "##{COMMON_SELECTOR_PUBLIC}_3_amount")
  element(:public_2018_2019, "##{COMMON_SELECTOR_PUBLIC}_4_amount")
  element(:public_2019_2020, "##{COMMON_SELECTOR_PUBLIC}_5_amount")
  element(:public_2020_2021, "##{COMMON_SELECTOR_PUBLIC}_6_amount")
  element(:public_2021_2022, "##{COMMON_SELECTOR_PUBLIC}_7_amount")

  element(:private_current_year, "##{COMMON_SELECTOR_PRIVATE}_0_amount")
  element(:private_2015_2016, "##{COMMON_SELECTOR_PRIVATE}_1_amount")
  element(:private_2016_2017, "##{COMMON_SELECTOR_PRIVATE}_2_amount")
  element(:private_2017_2018, "##{COMMON_SELECTOR_PRIVATE}_3_amount")
  element(:private_2018_2019, "##{COMMON_SELECTOR_PRIVATE}_4_amount")
  element(:private_2019_2020, "##{COMMON_SELECTOR_PRIVATE}_5_amount")
  element(:private_2020_2021, "##{COMMON_SELECTOR_PRIVATE}_6_amount")
  element(:private_2021_2022, "##{COMMON_SELECTOR_PRIVATE}_7_amount")

  element(:ea_current_year, "##{COMMON_SELECTOR_OTHER}_0_amount")
  element(:ea_2015_2016, "##{COMMON_SELECTOR_OTHER}_1_amount")
  element(:ea_2016_2017, "##{COMMON_SELECTOR_OTHER}_2_amount")
  element(:ea_2017_2018, "##{COMMON_SELECTOR_OTHER}_3_amount")
  element(:ea_2018_2019, "##{COMMON_SELECTOR_OTHER}_4_amount")
  element(:ea_2019_2020, "##{COMMON_SELECTOR_OTHER}_5_amount")
  element(:ea_2020_2021, "##{COMMON_SELECTOR_OTHER}_6_amount")
  element(:ea_2021_2022, "##{COMMON_SELECTOR_OTHER}_7_amount")

  element(:growth_current_year, "##{COMMON_SELECTOR}_0_growth_funding")
  element(:growth_2015_2016, "##{COMMON_SELECTOR}_1_growth_funding")
  element(:growth_2016_2017, "##{COMMON_SELECTOR}_2_growth_funding")
  element(:growth_2017_2018, "##{COMMON_SELECTOR}_3_growth_funding")
  element(:growth_2018_2019, "##{COMMON_SELECTOR}_4_growth_funding")
  element(:growth_2019_2020, "##{COMMON_SELECTOR}_5_growth_funding")
  element(:growth_2020_2021, "##{COMMON_SELECTOR}_6_growth_funding")
  element(:growth_2021_2022, "##{COMMON_SELECTOR}_7_growth_funding")

  element(:drain_current_year, "##{COMMON_SELECTOR}_0_internal_drainage_boards")
  element(:drain_2015_2016, "##{COMMON_SELECTOR}_1_internal_drainage_boards")
  element(:drain_2016_2017, "##{COMMON_SELECTOR}_2_internal_drainage_boards")
  element(:drain_2017_2018, "##{COMMON_SELECTOR}_3_internal_drainage_boards")
  element(:drain_2018_2019, "##{COMMON_SELECTOR}_4_internal_drainage_boards")
  element(:drain_2019_2020, "##{COMMON_SELECTOR}_5_internal_drainage_boards")
  element(:drain_2020_2021, "##{COMMON_SELECTOR}_6_internal_drainage_boards")
  element(:drain_2021_2022, "##{COMMON_SELECTOR}_7_internal_drainage_boards")

  element(:notyet_current_year, "##{COMMON_SELECTOR}_0_not_yet_identified")
  element(:notyet_2015_2016, "##{COMMON_SELECTOR}_1_not_yet_identified")
  element(:notyet_2016_2017, "##{COMMON_SELECTOR}_2_not_yet_identified")
  element(:notyet_2017_2018, "##{COMMON_SELECTOR}_3_not_yet_identified")
  element(:notyet_2018_2019, "##{COMMON_SELECTOR}_4_not_yet_identified")
  element(:notyet_2019_2020, "##{COMMON_SELECTOR}_5_not_yet_identified")
  element(:notyet_2020_2021, "##{COMMON_SELECTOR}_6_not_yet_identified")
  element(:notyet_2021_2022, "##{COMMON_SELECTOR}_7_not_yet_identified")

  element(:public_secure_current_year, "##{COMMON_SELECTOR_PUBLIC}_0_secured", visible: false)
  element(:public_secure_2015_2016, "##{COMMON_SELECTOR_PUBLIC}_1_secured", visible: false)
  element(:public_secure_2016_2017, "##{COMMON_SELECTOR_PUBLIC}_2_secured", visible: false)
  element(:public_secure_2017_2018, "##{COMMON_SELECTOR_PUBLIC}_3_secured", visible: false)
  element(:public_secure_2018_2019, "##{COMMON_SELECTOR_PUBLIC}_4_secured", visible: false)
  element(:public_secure_2019_2020, "##{COMMON_SELECTOR_PUBLIC}_5_secured", visible: false)
  element(:public_secure_2020_2021, "##{COMMON_SELECTOR_PUBLIC}_6_secured", visible: false)
  element(:public_secure_2021_2022, "##{COMMON_SELECTOR_PUBLIC}_7_secured", visible: false)

  element(:public_constrained_current_year, "##{COMMON_SELECTOR_PUBLIC}_0_constrained", visible: false)
  element(:public_constrained_2015_2016, "##{COMMON_SELECTOR_PUBLIC}_1_constrained", visible: false)
  element(:public_constrained_2016_2017, "##{COMMON_SELECTOR_PUBLIC}_2_constrained", visible: false)
  element(:public_constrained_2017_2018, "##{COMMON_SELECTOR_PUBLIC}_3_constrained", visible: false)
  element(:public_constrained_2018_2019, "##{COMMON_SELECTOR_PUBLIC}_4_constrained", visible: false)
  element(:public_constrained_2019_2020, "##{COMMON_SELECTOR_PUBLIC}_5_constrained", visible: false)
  element(:public_constrained_2020_2021, "##{COMMON_SELECTOR_PUBLIC}_6_constrained", visible: false)
  element(:public_constrained_2021_2022, "##{COMMON_SELECTOR_PUBLIC}_7_constrained", visible: false)

  element(:private_secure_current_year, "##{COMMON_SELECTOR_PRIVATE}_0_secured", visible: false)
  element(:private_secure_2015_2016, "##{COMMON_SELECTOR_PRIVATE}_1_secured", visible: false)
  element(:private_secure_2016_2017, "##{COMMON_SELECTOR_PRIVATE}_2_secured", visible: false)
  element(:private_secure_2017_2018, "##{COMMON_SELECTOR_PRIVATE}_3_secured", visible: false)
  element(:private_secure_2018_2019, "##{COMMON_SELECTOR_PRIVATE}_4_secured", visible: false)
  element(:private_secure_2019_2020, "##{COMMON_SELECTOR_PRIVATE}_5_secured", visible: false)
  element(:private_secure_2020_2021, "##{COMMON_SELECTOR_PRIVATE}_6_secured", visible: false)
  element(:private_secure_2021_2022, "##{COMMON_SELECTOR_PRIVATE}_7_secured", visible: false)

  element(:private_constrained_current_year, "##{COMMON_SELECTOR_PRIVATE}_0_constrained", visible: false)
  element(:private_constrained_2015_2016, "##{COMMON_SELECTOR_PRIVATE}_1_constrained", visible: false)
  element(:private_constrained_2016_2017, "##{COMMON_SELECTOR_PRIVATE}_2_constrained", visible: false)
  element(:private_constrained_2017_2018, "##{COMMON_SELECTOR_PRIVATE}_3_constrained", visible: false)
  element(:private_constrained_2018_2019, "##{COMMON_SELECTOR_PRIVATE}_4_constrained", visible: false)
  element(:private_constrained_2019_2020, "##{COMMON_SELECTOR_PRIVATE}_5_constrained", visible: false)
  element(:private_constrained_2020_2021, "##{COMMON_SELECTOR_PRIVATE}_6_constrained", visible: false)
  element(:private_constrained_2021_2022, "##{COMMON_SELECTOR_PRIVATE}_7_constrained", visible: false)

  element(:ea_secure_current_year, "##{COMMON_SELECTOR_OTHER}_0_secured", visible: false)
  element(:ea_secure_2015_2016, "##{COMMON_SELECTOR_OTHER}_1_secured", visible: false)
  element(:ea_secure_2016_2017, "##{COMMON_SELECTOR_OTHER}_2_secured", visible: false)
  element(:ea_secure_2017_2018, "##{COMMON_SELECTOR_OTHER}_3_secured", visible: false)
  element(:ea_secure_2018_2019, "##{COMMON_SELECTOR_OTHER}_4_secured", visible: false)
  element(:ea_secure_2019_2020, "##{COMMON_SELECTOR_OTHER}_5_secured", visible: false)
  element(:ea_secure_2020_2021, "##{COMMON_SELECTOR_OTHER}_6_secured", visible: false)
  element(:ea_secure_2021_2022, "##{COMMON_SELECTOR_OTHER}_7_secured", visible: false)

  element(:ea_constrained_current_year, "##{COMMON_SELECTOR_OTHER}_0_constrained", visible: false)
  element(:ea_constrained_2015_2016, "##{COMMON_SELECTOR_OTHER}_1_constrained", visible: false)
  element(:ea_constrained_2016_2017, "##{COMMON_SELECTOR_OTHER}_2_constrained", visible: false)
  element(:ea_constrained_2018_2019, "##{COMMON_SELECTOR_OTHER}_4_constrained", visible: false)
  element(:ea_constrained_2017_2018, "##{COMMON_SELECTOR_OTHER}_3_constrained", visible: false)
  element(:ea_constrained_2019_2020, "##{COMMON_SELECTOR_OTHER}_5_constrained", visible: false)
  element(:ea_constrained_2020_2021, "##{COMMON_SELECTOR_OTHER}_6_constrained", visible: false)
  element(:ea_constrained_2021_2022, "##{COMMON_SELECTOR_OTHER}_7_constrained", visible: false)

  elements(:sources, "input[type='number']")

  element(:submit_button, "input[name='commit']")
  # rubocop:enable Style/MutableConstant

  # rubocop:disable Metrics/AbcSize, Metrics/MethodLength
  def submit(args = {})
    case args[:new_funding]
    when :public_secure
      private_constrained_current_year.click
      public_secure_2015_2016.click
      public_secure_2017_2017.click
      public_secure_2017_2018.click
      public_secure_2018_2019.click
      public_secure_2019_2020.click
      public_secure_2020_2021.click
      public_secure_2021_2022.click
    when :private_secure
      private_secure_current_year true
      private_secure_2015_2016.click
      private_secure_2017_2017.click
      private_secure_2017_2018.click
      private_secure_2018_2019.click
      private_secure_2019_2020.click
      private_secure_2020_2021.click
      private_secure_2021_2022.click
    when :other_secure
      other_secure_current_year.click
      other_secure_2015_2016.click
      other_secure_2017_2017.click
      other_secure_2017_2018.click
      other_secure_2018_2019.click
      other_secure_2019_2020.click
      other_secure_2020_2021.click
      other_secure_2021_2022.click
    end

    submit_button.click
  end
  # rubocop: enable Metrics/ClassLength, Metrics/AbcSize, Metrics/MethodLength
end
