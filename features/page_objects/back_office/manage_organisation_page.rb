require_relative "section/admin_nav_bar_section"

class ManageOrganisationPage < BasePage

  element(:search_field, "#q")
  element(:org_type, "select[id='type']")
  element(:first_organisation_name, "tr:nth-child(2) td:nth-child(1)")
  element(:edit_organisation, "a[href$='/edit']")

  section(:admin_bar, AdminBarSection, AdminBarSection::SELECTOR)

  def search(args = {})
    search_field.set(args[:organisation]) if args.key?(:organisation)
    org_type.select(args[:organisation_type]) if args.key?(:organisation_type)
    submit_button.click
  end

end
