require_relative "base_page"

class FrontOfficeHomePage < BasePage

  set_url(Quke::Quke.config.custom["urls"]["front_office"].to_s)
  element(:start_button, ".button.button-start")

end
