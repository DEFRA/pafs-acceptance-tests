require "faker"

class ContributorAddPage < BasePage

  section(:user_bar, AdminUserBarSection, AdminUserBarSection::SELECTOR)
  element(:add_contributor, "a[class='add_element']")
  elements(:contributer_field, "input[id$='current']")

  def submit(_args = {})
    contributer_field.last.set(create_contributor)
    submit_button.click
  end

  def create_contributor
    "#{Faker::Name.first_name} #{Faker::Name.last_name}"
  end

end
