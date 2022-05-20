class NaturalFloodRiskMeasuresQuestionPage < BasePage

  section(:user_bar, AdminUserBarSection, AdminUserBarSection::SELECTOR)

  element(:yes, "[value='yes']")
  element(:no, "[value='no']")

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
