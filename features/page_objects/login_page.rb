class LoginPage < BasePage

  element(:alert_invalid, "div.alert-danger[role='alert']", text: "Invalid email or password")

  element(:email, "#user-email-field")
  element(:password, "#user-password-field")
  element(:sign_in, "#new_user [type='submit']")

  def submit(args = {})
    email.set(args[:email]) if args.key?(:email)
    password.set(args[:password]) if args.key?(:password)

    sign_in.click
  end

end
