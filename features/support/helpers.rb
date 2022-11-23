def choose_cookie_option
  # Randomise between accepting or rejecting cookies
  i = rand(2)
  if i.zero?
    @app.login_page.cookie_choice(choice: :accept)
  else
    @app.login_page.cookie_choice(choice: :reject)
  end
end

def convert_to_currency_format(number)
  whole, decimal = number.to_s.split(".")
  num_groups = whole.chars.to_a.reverse.each_slice(3)
  whole_with_commas = num_groups.map(&:join).join(",").reverse
  [whole_with_commas, decimal].compact.join(".")
end

def random_number
  rand(1..1_000_000)
end

def remove_hyphen_and_capitalise_start(string)
  string.split("-").join(" ").capitalize
end
