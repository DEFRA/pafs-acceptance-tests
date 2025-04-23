require_relative "base_page"

class BackOfficeHomePage < BasePage

  set_url(Quke::Quke.config.custom["urls"]["back_office"].to_s)
  element(:start_button, ".button.button-start")

end
