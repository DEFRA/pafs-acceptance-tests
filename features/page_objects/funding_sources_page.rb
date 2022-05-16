class FundingSourcesPage < BasePage

  section(:user_bar, AdminUserBarSection, AdminUserBarSection::SELECTOR)

  element(:grant_in_aid, "#funding_sources_step_fcerm_gia", visible: false)
  element(:local_levy, "#funding_sources_step_local_levy", visible: false)
  element(:public_sector, "#funding_sources_step_public_contributions", visible: false)
  element(:private_sector, "#funding_sources_step_private_contributions", visible: false)
  element(:ea_contributions, "#funding_sources_step_other_ea_contributions", visible: false)
  element(:growth_funding, "#funding_sources_step_growth_funding", visible: false)
  element(:drainage_board, "#funding_sources_step_internal_drainage_boards", visible: false)
  element(:other, "#funding_sources_step_not_yet_identified", visible: false)

  elements(:sources, "input[type='checkbox']", visible: false)

  element(:submit_button, "input[name='commit']")

  def submit(args = {})
    if args.key?(:funding_sources)
      args[:funding_sources].each do |source|

        search_val = "funding_sources_step_#{source}"
        sources.find { |chk| chk["id"] == search_val }.click
      end
    end

    submit_button.click
  end

end
