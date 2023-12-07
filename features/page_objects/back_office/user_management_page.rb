require_relative "base_page"

class UserManagementPage < BasePage

  section(:user_bar, UserBarSection, UserBarSection::SELECTOR)

end
