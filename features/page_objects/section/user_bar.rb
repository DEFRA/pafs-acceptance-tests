class UserBarSection < SitePrism::Section

  SELECTOR = ".user-bar".freeze

  element(:projects, "a[href='/pc/projects']")

  element(:sign_out_link, "a[href='/users/sign_out']")

end
