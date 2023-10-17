require_relative "section/admin_nav_bar_section"
class EditOrganisationPage < BasePage

  element(:organisation_field, "#organisation-name-field")
  element(:identifier_code, "#organisation-identifier-field")
  element(:authority_code, "select#organisation-sub-type-field")
  element(:associated_pso, "select#organisation-parent-id-field")
  element(:end_date, "#organisation_end_date")

  section(:admin_bar, AdminBarSection, AdminBarSection::SELECTOR)

  def submit(args = {})
    organisation_field.set(args[:org_name]) if args.key?(:org_name)
    identifier_code.set(args[:id_code]) if args.key?(:id_code)
    authority_code.select(args[:auth_code]) if args.key?(:auth_code)
    associated_pso.select(args[:pso]) if args.key?(:pso)
    end_date.click
    fill_in(:end_date, with: :date) if args.key?(:date)
    submit_button.click
  end

end
