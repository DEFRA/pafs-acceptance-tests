class FcrmFundingSourcesPage < BasePage

  section(:user_bar, AdminUserBarSection, AdminUserBarSection::SELECTOR)

  elements(:sources, "input[type='checkbox']", visible: false)

  def submit(args = {})
    return unless args.key?(:funding_sources)

    search_val = "fcrm-gia-funding-sources-step-#{args[:funding_sources]}-#{args[:funding_sources]}-field"
    sources.find { |chk| chk["id"] == search_val }.click
  end

end
