class ImproveSpaOrSacPage < SitePrism::Page

  section(:user_bar, AdminUserBarSection, AdminUserBarSection::SELECTOR)

  element(:improve_yes, "#improve_spa_or_sac_step_improve_spa_or_sac_true", visible: false)
  element(:improve_no, "#improve_spa_or_sac_step_improve_spa_or_sac_false", visible: false)

  element(:submit_button, "input[name='commit']")

  def submit(args = {})
    if args[:improve]
      improve_yes.click
    else
      improve_no.click
    end

    submit_button.click
  end

end
