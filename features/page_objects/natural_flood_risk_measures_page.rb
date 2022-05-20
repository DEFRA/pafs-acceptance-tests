# frozen_string_literal: true

class NaturalFloodRiskMeasuresPage < BasePage

  elements(:measures, "input[name='exemptions_form[exemption_ids][]']", visible: false)

  def submit(args = {})
    if args.key?(:measures)
      args[:measures].each do |ex|
        search_val = "exemptions_form_checkbox-#{ex}"
        measures.find { |chk| chk["id"] == search_val }.click
      end
    end

    submit_button.click
  end

end
