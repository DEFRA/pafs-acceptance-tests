class NaturalFloodRiskMeasuresQuestionPage < BasePage

  section(:user_bar, AdminUserBarSection, AdminUserBarSection::SELECTOR)

  element(:yes, "#natural_flood_risk_measures_included_step_natural_flood_risk_measures_included_true+ .block-label")
  element(:no, "#natural_flood_risk_measures_included_step_natural_flood_risk_measures_included_false+ .block-label")
  element(:guidance, "a[href$='working-with-natural-processes-to-reduce-flood-risk']")

  def submit(args = {})
    case args[:choice]
    when :yes
      yes.click
    when :no
      no.click
    end

    submit_button.click
  end

end
