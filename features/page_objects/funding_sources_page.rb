class FundingSourcesPage < BasePage

  section(:user_bar, AdminUserBarSection, AdminUserBarSection::SELECTOR)

  elements(:sources, "input[type='checkbox']", visible: false)

  def submit(args = {})
    return unless args.key?(:funding_sources)

    search_val = "funding_sources_step_#{args[:funding_sources]}"
    sources.find { |chk| chk["id"] == search_val }.click
  end

end
