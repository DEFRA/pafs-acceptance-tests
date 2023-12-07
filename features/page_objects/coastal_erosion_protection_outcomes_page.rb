class CoastalErosionProtectionOutcomesPage < BasePage

  section(:user_bar, UserBarSection, UserBarSection::SELECTOR)

  elements(:column_a, "input.households-protected")
  elements(:column_b, "input.significant-to-low-risk")
  elements(:column_c, "input.most-deprived")
  elements(:column_d, "input.non-residential-properties")

  # My project does not reduce the risk of coastal erosion for any properties
  element(:no_properties_moved_to_lower_risk, "input[id$='households_for_coastal_erosion']", visible: false)

  element(:column_a_total, ".households-at-reduced-risk-total")
  element(:column_b_total, ".moved-from-very-significant-and-significant-to-moderate-or-low-total")
  element(:column_c_total, ".households-protected-from-loss-in-20-percent-most-deprived-total")
  element(:column_d_total, ".non-residential-properties")

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
    end
    submit_button.click
  end
end
