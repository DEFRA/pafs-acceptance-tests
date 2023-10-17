require_relative "base_page"
require_relative "section/user_bar"

class ApproachPage < BasePage

  section(:user_bar, UserBarSection, UserBarSection::SELECTOR)

  element(:approach, "#approach-step-approach-field")

  def submit(args = {})
    approach.set(args[:approach]) if args.key?(:approach)
    submit_button.click
  end

end
