# frozen_string_literal: true

class NaturalFloodRiskMeasuresPage < BasePage

  elements(:measures, "input[type='checkbox']", visible: false)

  def submit(args = {})
    if args.key?(:measures)
      args[:measures].each do |name|
        search_val = "natural_flood_risk_measures_step[#{name}]"
        measures.find { |chk| chk["name"] == search_val }.click
      end
    end

    submit_button.click
  end

end
