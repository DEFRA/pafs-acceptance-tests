class RisksPage < BasePage

  section(:user_bar, AdminUserBarSection, AdminUserBarSection::SELECTOR)

  elements(:sources, "input[type='checkbox']", visible: false)

  def submit(args = {})
    return unless args.key?(:risks_source)

    args[:risks_source].each do |risk_source|
      search_val = "risks_step_#{risk_source.join('')}"
      sources.find { |chk| chk["id"] == search_val }.click
    end
  end

end
