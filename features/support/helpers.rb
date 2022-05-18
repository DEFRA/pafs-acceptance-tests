def choose_cookie_option
  # Randomise between accepting or rejecting cookies
  i = rand(2)
  if i.zero?
    @app.login_page.cookie_choice(choice: :accept)
  else
    @app.login_page.cookie_choice(choice: :reject)
  end
end
