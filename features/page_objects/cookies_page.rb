class CookiesPage < BasePage

  section(:user_bar, AdminUserBarSection, AdminUserBarSection::SELECTOR)

  element(:yes, "input[text='Yes']")
  element(:no, "input[text='No']")

  def submit(args = {})
    case args[:option]
    when :yes
      yes.click
    when :Yes
      yes.click
    when :no
      no.click
    when :No
      no.click
    end
  end

end
