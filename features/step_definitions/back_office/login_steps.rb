Given(/^I sign into the back office as "([^"]*)"$/) do |user|
  @app = App.new
  @app.back_office_home_page.load
  @app.back_office_login_page.submit(
    email: user,
    password: ENV.fetch("PAFS_DEFAULT_PASSWORD", nil)
  )
end
