class LoginPage < BasePage

  element(:alert_invalid, "div.alert-danger[role='alert']", text: "Invalid email or password")

  element(:email, "#user-email-field")
  element(:password, "#user-password-field")

  def submit(args = {})
    email.set(args[:email]) if args.key?(:email)
    password.set(args[:password]) if args.key?(:password)

    submit_button.click
  end

end
