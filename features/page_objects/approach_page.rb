require_relative "base_page"

class ApproachPage < BasePage

  section(:user_bar, AdminUserBarSection, AdminUserBarSection::SELECTOR)

  element(:approach, "#approach-step-approach-field")

  def submit(args = {})
    approach.set(args[:approach]) if args.key?(:approach)
    submit_button.click
  end

end
