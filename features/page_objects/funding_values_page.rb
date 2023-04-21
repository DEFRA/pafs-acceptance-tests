class FundingValuesPage < BasePage

  section(:user_bar, AdminUserBarSection, AdminUserBarSection::SELECTOR)

  elements(:gia_years, "input[name$='[fcerm_gia]']")
  elements(:local_levy_years, "input[name$='[local_levy]']")
  elements(:additional_gia_years, "input[name$='[growth_funding]']")
  elements(:internal_drainage_board_years, "input[name$='[internal_drainage_boards]']")
  elements(:not_yet_identified_years, "input[name$='[not_yet_identified]']")
  elements(:environment_stat_years, "input[name$='[environment_statutory_funding]']")
  elements(:freq_flood_years, "input[name$='[frequently_flooded_communities]']")
  elements(:other_gia_years, "input[name$='[other_additional_grant_in_aid]']")
  elements(:other_gov_years, "input[name$='[other_government_department]']")
  elements(:summer_economic_years, "input[name$='[summer_economic_fund]']")
  elements(:recovery_years, "input[name$='[recovery]']")
  elements(:asset_replacement_years, "input[name$='[asset_replacement_allowance]']")
  elements(:financial_years, ".financial_year")
  element(:gia_funding_total, ".fcerm_gia-total")
  element(:local_levy_funding_total, ".local_levy-total")
  element(:growth_funding_total, ".growth_funding-total")
  element(:public_funding_total, " .public_contributions-total")
  element(:private_funding_total, ".private_contributions-total")
  element(:recovery_total, ".recovery-total")
  element(:asset_replacement_allowance_total, ".asset_replacement_allowance-total")
  element(:environment_statutory_funding_total, ".environment_statutory_funding-total")
  element(:frequently_flooded_communities_total, ".frequently_flooded_communities-total")
  element(:other_additional_grant_in_aid_total, ".other_additional_grant_in_aid-total")
  element(:other_government_department_total, ".other_government_department-total")
  element(:summer_economic_fund_total, ".summer_economic_fund-total")

  element(:grand_total, ".grand-total")

  # rubocop:disable Metrics/CyclomaticComplexity, Metrics/MethodLength, Metrics/AbcSize, Metrics/PerceivedComplexity
  def submit(args = {})
    case args[:funding]
    when :gia
      gia_years.each do |year|
        year.set(rand(1..10_000))
      end
    when :local_levy
      local_levy_years.each do |year|
        year.set(rand(1..10_000))
      end
    when :additional_grant_in_aid
      additional_gia_years.each do |year|
        year.set(rand(1..10_000))
      end
    when :internal_drainage_boards
      internal_drainage_board_years.each do |year|
        year.set(rand(1..10_000))
      end
    when :not_yet_identified
      not_yet_identified_years.each do |year|
        year.set(rand(1..10_000))
      end
    when :environment_stat
      environment_stat_years.each do |year|
        year.set(rand(1..10_000))
      end
    when :freq_flood
      freq_flood_years.each do |year|
        year.set(rand(1..10_000))
      end
    when :other_gia
      other_gia_years.each do |year|
        year.set(rand(1..10_000))
      end
    when :other_gov
      other_gov_years.each do |year|
        year.set(rand(1..10_000))
      end
    when :summer_economic
      summer_economic_years.each do |year|
        year.set(rand(1..10_000))
      end
    when :recovery
      recovery_years.each do |year|
        year.set(rand(1..10_000))
      end
    when :asset_replacement
      asset_replacement_years.each do |year|
        year.set(rand(1..10_000))
      end
    end
  end
  # rubocop:enable Metrics/CyclomaticComplexity, Metrics/MethodLength, Metrics/AbcSize, Metrics/PerceivedComplexity
end
