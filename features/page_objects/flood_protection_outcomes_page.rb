class FloodProtectionOutcomesPage < BasePage

  section(:user_bar, AdminUserBarSection, AdminUserBarSection::SELECTOR)
  # How many properties affected by flooding is the project likely to benefit?

  elements(:column_a, "input.reduced-risk")
  elements(:column_b, "input.significant-to-low-risk")
  elements(:column_c, "input.most-deprived")
  elements(:column_d, "input.plp-measures")
  elements(:column_e, "input.non-residential-properties")

  # My project does not move any properties to a lower flood risk category
  element(:no_properties_moved_to_lower_risk, "input[id$='floods-reduced-risk-of-households-for-floods-field']", visible: false)
  
  element(:column_a_total, ".households-at-reduced-risk-total")
  element(:column_b_total, ".moved-from-very-significant-and-significant-to-moderate-or-low-total")
  element(:column_c_total, ".households-protected-from-loss-in-20-percent-most-deprived-total")
  element(:column_d_total, ".households-protected-through-plp-measures")
  element(:column_e_total, ".non-residential-properties")
  # rubocop:disable Metrics/CyclomaticComplexity, Metrics/MethodLength
  def submit(args = {})
    case args[:benefit]
    when :none
      no_properties_moved_to_lower_risk.click
    when :random
      column_a.each do |cell|
        cell.set(rand(1000..10_000))
      end
      column_b.each do |cell|
        cell.set(rand(100..1000))
      end
      column_c.each do |cell|
        cell.set(rand(10..100))
      end
      column_d.each do |cell|
        cell.set(rand(0..10))
      end
      column_e.each do |cell|
        cell.set(rand(0..10))
      end
    end
    submit_button.click
  end
end
# rubocop:enable Metrics/CyclomaticComplexity, Metrics/MethodLength
