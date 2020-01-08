class RisksPage < SitePrism::Page

  section(:user_bar, AdminUserBarSection, AdminUserBarSection::SELECTOR)

  elements(:sources, "input[type='checkbox']")
  element(:submit_button, "input[name='commit']")

  def submit(args = {})
    # wait_for_sources
    if args.key?(:risks_source)
      args[:risks_source].each do |risk_source|

        search_val = "risks_step_#{risk_source}"
        sources.find { |chk| chk["id"] == search_val }.click
      end
    end

    submit_button.click
  end

end
