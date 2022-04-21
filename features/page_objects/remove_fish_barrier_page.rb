class RemoveFishBarrierPage < BasePage

  section(:user_bar, AdminUserBarSection, AdminUserBarSection::SELECTOR)

  element(:remove_yes, "#remove_fish_barrier_step_remove_fish_barrier_true", visible: false)
  element(:remove_no, "#remove_fish_barrier_step_remove_fish_barrier_false", visible: false)

  element(:submit_button, "input[name='commit']")

  def submit(args = {})
    if args[:remove]
      remove_yes.click
    else
      remove_no.click
    end

    submit_button.click
  end

end
