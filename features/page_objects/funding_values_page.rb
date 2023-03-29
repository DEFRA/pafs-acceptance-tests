class FundingValuesPage < BasePage

  section(:user_bar, AdminUserBarSection, AdminUserBarSection::SELECTOR)

  elements(:gia_years, "input[name$='[fcerm_gia]']")
  elements(:local_levy_years, "input[name$='[local_levy]']")
  elements(:additional_gia_years, "input[name$='[growth_funding]']")
  elements(:internal_drainage_board_years, "input[name$='[internal_drainage_boards]']")
  elements(:not_yet_identified_years, "input[name$='[not_yet_identified]']")
  # Update
  elements(:environment_stat_years, "input[name$='[not_yet_identified]']")
  elements(:freq_flood_years, "input[name$='[not_yet_identified]']")
  elements(:other_gia_years, "input[name$='[not_yet_identified]']")
  elements(:other_gov, "input[name$='[not_yet_identified]']")
  elements(:summer_economic, "input[name$='[not_yet_identified]']")

  elements(:financial_years, ".financial_year")
  element(:gia_funding_total, ".fcerm_gia-total")
  element(:local_levy_funding_total, ".local_levy-total")
  element(:growth_funding_total, ".growth_funding-total")
  element(:public_funding_total, " .public_contributions-total")
  element(:private_funding_total, " .private_contributions-total")
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

    end
  end
  # rubocop:enable Metrics/CyclomaticComplexity, Metrics/MethodLength, Metrics/AbcSize, Metrics/PerceivedComplexity
end
