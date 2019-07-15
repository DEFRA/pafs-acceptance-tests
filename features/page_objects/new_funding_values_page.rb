class NewFundingValuesPage < SitePrism::Page

  section(:user_bar, AdminUserBarSection, AdminUserBarSection::SELECTOR)

  element(:gia_current_year, "#funding_values_step_funding_values_attributes_0_fcerm_gia")
  element(:gia_2015_2016, "#funding_values_step_funding_values_attributes_1_fcerm_gia")
  element(:gia_2016_2017, "#funding_values_step_funding_values_attributes_2_fcerm_gia")
  element(:gia_2017_2018, "#funding_values_step_funding_values_attributes_3_fcerm_gia")
  element(:gia_2018_2019, "#funding_values_step_funding_values_attributes_4_fcerm_gia")
  element(:gia_2019_2020, "#funding_values_step_funding_values_attributes_5_fcerm_gia")

  element(:levy_current_year, "#funding_values_step_funding_values_attributes_0_local_levy")
  element(:levy_2015_2016, "#funding_values_step_funding_values_attributes_1_local_levy")
  element(:levy_2016_2017, "#funding_values_step_funding_values_attributes_2_local_levy")
  element(:levy_2017_2018, "#funding_values_step_funding_values_attributes_3_local_levy")
  element(:levy_2018_2019, "#funding_values_step_funding_values_attributes_4_local_levy")
  element(:levy_2019_2020, "#funding_values_step_funding_values_attributes_5_local_levy")

  element(:public_current_year, "#public_contributor_values_step_funding_contributors_attributes_0_amount")
  element(:public_2015_2016, "#public_contributor_values_step_funding_contributors_attributes_1_amount")
  element(:public_2016_2017, "#public_contributor_values_step_funding_contributors_attributes_2_amount")
  element(:public_2017_2018, "#public_contributor_values_step_funding_contributors_attributes_3_amount")
  element(:public_2018_2019, "#public_contributor_values_step_funding_contributors_attributes_4_amount")
  element(:public_2019_2020, "#public_contributor_values_step_funding_contributors_attributes_5_amount")

  element(:private_current_year, "#private_contributor_values_step_funding_contributors_attributes_0_amount")
  element(:private_2015_2016, "#private_contributor_values_step_funding_contributors_attributes_1_amount")
  element(:private_2016_2017, "#private_contributor_values_step_funding_contributors_attributes_2_amount")
  element(:private_2017_2018, "#private_contributor_values_step_funding_contributors_attributes_3_amount")
  element(:private_2018_2019, "#private_contributor_values_step_funding_contributors_attributes_4_amount")
  element(:private_2019_2020, "#private_contributor_values_step_funding_contributors_attributes_5_amount")

  element(:ea_current_year, "#other_ea_contributor_values_step_funding_contributors_attributes_0_amount")
  element(:ea_2015_2016, "#other_ea_contributor_values_step_funding_contributors_attributes_1_amount")
  element(:ea_2016_2017, "#other_ea_contributor_values_step_funding_contributors_attributes_2_amount")
  element(:ea_2017_2018, "#other_ea_contributor_values_step_funding_contributors_attributes_3_amount")
  element(:ea_2018_2019, "#other_ea_contributor_values_step_funding_contributors_attributes_4_amount")
  element(:ea_2019_2020, "#other_ea_contributor_values_step_funding_contributors_attributes_5_amount")

  element(:growth_current_year, "#funding_values_step_funding_values_attributes_0_growth_funding")
  element(:growth_2015_2016, "#funding_values_step_funding_values_attributes_1_growth_funding")
  element(:growth_2016_2017, "#funding_values_step_funding_values_attributes_2_growth_funding")
  element(:growth_2017_2018, "#funding_values_step_funding_values_attributes_3_growth_funding")
  element(:growth_2018_2019, "#funding_values_step_funding_values_attributes_4_growth_funding")
  element(:growth_2019_2020, "#funding_values_step_funding_values_attributes_5_growth_funding")

  element(:drain_current_year, "#funding_values_step_funding_values_attributes_0_internal_drainage_boards")
  element(:drain_2015_2016, "#funding_values_step_funding_values_attributes_1_internal_drainage_boards")
  element(:drain_2016_2017, "#funding_values_step_funding_values_attributes_2_internal_drainage_boards")
  element(:drain_2017_2018, "#funding_values_step_funding_values_attributes_3_internal_drainage_boards")
  element(:drain_2018_2019, "#funding_values_step_funding_values_attributes_4_internal_drainage_boards")
  element(:drain_2019_2020, "#funding_values_step_funding_values_attributes_5_internal_drainage_boards")

  element(:notyet_current_year, "#funding_values_step_funding_values_attributes_0_not_yet_identified")
  element(:notyet_2015_2016, "#funding_values_step_funding_values_attributes_1_not_yet_identified")
  element(:notyet_2016_2017, "#funding_values_step_funding_values_attributes_2_not_yet_identified")
  element(:notyet_2017_2018, "#funding_values_step_funding_values_attributes_3_not_yet_identified")
  element(:notyet_2018_2019, "#funding_values_step_funding_values_attributes_4_not_yet_identified")
  element(:notyet_2019_2020, "#funding_values_step_funding_values_attributes_5_not_yet_identified")

  elements(:sources, "input[type='number']")

  element(:submit_button, "input[name='commit']")

  def submit(args = {})
    if args.key?(:funding_values)
      args[:funding_values].each do |source|

        search_val_one = "funding_values_step_funding_values_attributes_0_#{source}"
        sources.find { |chk| chk["id"] == search_val_one }.set "1000"

        search_val_two = "funding_values_step_funding_values_attributes_1_#{source}"
        sources.find { |chk| chk["id"] == search_val_two }.set "1000"

        search_val_three = "funding_values_step_funding_values_attributes_2_#{source}"
        sources.find { |chk| chk["id"] == search_val_three }.set "1000"
      end
    end

    submit_button.click
  end

end