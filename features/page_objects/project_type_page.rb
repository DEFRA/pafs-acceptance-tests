class ProjectTypePage < BasePage

  section(:user_bar, UserBarSection, UserBarSection::SELECTOR)

  element(:defence, "#project-type-step-project-type-def-field", visible: false)
  element(:cm, "#project-type-step-project-type-cm-field", visible: false)
  element(:plp, "#project-type-step-project-type-plp-field", visible: false)
  element(:str, "#project-type-step-project-type-str-field", visible: false)
  element(:households_yes, "#project-type-step-project-type-env-with-households-field", visible: false)
  element(:households_no, "#project-type-step-project-type-env-without-households-field", visible: false)

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
