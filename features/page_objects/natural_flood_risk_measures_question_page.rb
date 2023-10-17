class NaturalFloodRiskMeasuresQuestionPage < BasePage

  section(:user_bar, UserBarSection, UserBarSection::SELECTOR)

  element(:yes, "#natural-flood-risk-measures-included-step-natural-flood-risk-measures-included-true-field",
          visible: false)
  element(:no, "#natural-flood-risk-measures-included-step-natural-flood-risk-measures-included-false-field",
          visible: false)
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
