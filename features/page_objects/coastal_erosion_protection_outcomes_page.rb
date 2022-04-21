class CoastalErosionProtectionOutcomesPage < BasePage

  section(:user_bar, AdminUserBarSection, AdminUserBarSection::SELECTOR)

  # rubocop:disable Style/MutableConstant
  COMMON_SELECTOR = "coastal_erosion_protection_outcomes_step_coastal_erosion_protection_outcomes_attributes"

  element(:a1, "##{COMMON_SELECTOR}_0_households_at_reduced_risk")
  element(:a2, "##{COMMON_SELECTOR}_1_households_at_reduced_risk")
  element(:a3, "##{COMMON_SELECTOR}_2_households_at_reduced_risk")
  element(:a4, "##{COMMON_SELECTOR}_3_households_at_reduced_risk")
  element(:a5, "##{COMMON_SELECTOR}_4_households_at_reduced_risk")
  element(:a6, "##{COMMON_SELECTOR}_5_households_at_reduced_risk")
  element(:a7, "##{COMMON_SELECTOR}_6_households_at_reduced_risk")

  element(:b1, "##{COMMON_SELECTOR}_0_households_protected_from_loss_in_next_20_years")
  element(:b2, "##{COMMON_SELECTOR}_1_households_protected_from_loss_in_next_20_years")
  element(:b3, "##{COMMON_SELECTOR}_2_households_protected_from_loss_in_next_20_years")
  element(:b4, "##{COMMON_SELECTOR}_3_households_protected_from_loss_in_next_20_years")
  element(:b5, "##{COMMON_SELECTOR}_4_households_protected_from_loss_in_next_20_years")
  element(:b6, "##{COMMON_SELECTOR}_5_households_protected_from_loss_in_next_20_years")
  element(:b7, "##{COMMON_SELECTOR}_6_households_protected_from_loss_in_next_20_years")

  element(:c1, "##{COMMON_SELECTOR}_0_households_protected_from_loss_in_20_percent_most_deprived")
  element(:c2, "##{COMMON_SELECTOR}_1_households_protected_from_loss_in_20_percent_most_deprived")
  element(:c3, "##{COMMON_SELECTOR}_2_households_protected_from_loss_in_20_percent_most_deprived")
  element(:c4, "##{COMMON_SELECTOR}_3_households_protected_from_loss_in_20_percent_most_deprived")
  element(:c5, "##{COMMON_SELECTOR}_4_households_protected_from_loss_in_20_percent_most_deprived")
  element(:c6, "##{COMMON_SELECTOR}_5_households_protected_from_loss_in_20_percent_most_deprived")
  element(:c7, "##{COMMON_SELECTOR}_6_households_protected_from_loss_in_20_percent_most_deprived")
  # rubocop:disable Layout/LineLength
  element(:select_none, "#coastal_erosion_protection_outcomes_step_reduced_risk_of_households_for_coastal_erosion", visible: false)
  # rubocop:enable Layout/LineLength
  element(:submit_button, "input[name='commit']")
  # rubocop:enable Style/MutableConstant

  # rubocop:disable Metrics/AbcSize, Metrics/CyclomaticComplexity, Metrics/PerceivedComplexity, Metrics/MethodLength
  def submit(args = {})
    if args.key?(:outcome) == true
      select_none.set(args[:select_none]).click
    else
      a1.set(args[:a1]) if args.key?(:a1)
      a2.set(args[:a2]) if args.key?(:a2)
      a3.set(args[:a3]) if args.key?(:a3)
      a4.set(args[:a4]) if args.key?(:a4)
      a5.set(args[:a5]) if args.key?(:a5)
      a6.set(args[:a6]) if args.key?(:a6)
      a7.set(args[:a7]) if args.key?(:a7)
      b1.set(args[:b1]) if args.key?(:b1)
      b2.set(args[:b2]) if args.key?(:b2)
      b3.set(args[:b3]) if args.key?(:b3)
      b4.set(args[:b4]) if args.key?(:b4)
      b5.set(args[:b5]) if args.key?(:b5)
      b6.set(args[:b6]) if args.key?(:b6)
      b7.set(args[:b7]) if args.key?(:b7)
      c1.set(args[:c1]) if args.key?(:c1)
      c2.set(args[:c2]) if args.key?(:c2)
      c3.set(args[:c3]) if args.key?(:c3)
      c4.set(args[:c4]) if args.key?(:c4)
      c5.set(args[:c5]) if args.key?(:c5)
      c6.set(args[:c6]) if args.key?(:c6)
      c7.set(args[:c7]) if args.key?(:c7)
    end

    submit_button.click
  end

end
# rubocop:enable Metrics/AbcSize, Metrics/CyclomaticComplexity, Metrics/PerceivedComplexity, Metrics/MethodLength
