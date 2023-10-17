class AdminBarSection < SitePrism::Section

  SELECTOR = ".user-bar".freeze

  element(:view_all_projects, "a[href='/admin/projects']")
  element(:view_users, "a[href='/admin/users']")
  element(:add_organisation, "a[href='/admin/organisations/new']")
  element(:manage_organisations, "a[href='/admin/organisations']")

  element(:sign_out_link, "a[href='/users/sign_out']")

end
