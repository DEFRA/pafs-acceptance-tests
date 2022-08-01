class ProjectTypePage < BasePage

  section(:user_bar, AdminUserBarSection, AdminUserBarSection::SELECTOR)

  element(:defence, "#project_type_step_project_type_def", visible: false)
  element(:cm, "#project_type_step_project_type_cm", visible: false)
  element(:plp, "#project_type_step_project_type_plp", visible: false)
  element(:brg, "#project_type_step_project_type_brg", visible: false)
  element(:str, "#project_type_step_project_type_str", visible: false)
  element(:households_yes, "#project_type_step_project_type_env_with_households", visible: false)
  element(:households_no, "#project_type_step_project_type_env_without_households", visible: false)

  def submit(args = {})
    case args[:option].to_s
    # Changing the current standard of service....
    when "new or improve asset"
      defence.click
    # Restore the standard of service.....
    when "restore asset"
      cm.click
    # Property level protection for properties within the 'very significant' flood band....
    when "property level protection"
      plp.click
    # Strategy for complex flood or coastal erosion risk situations across several interconnected areas
    when "strategy"
      str.click
    # Environmental project that also benefits households
    when "benefits households"
      households_yes.click
    # Environmental project that doesn't benefit any households
    when "no household benefit"
      households_no.click
    end
    submit_button.click
  end

end
