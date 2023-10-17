class ContributerFundingValuesPage < BasePage

  section(:user_bar, UserBarSection, UserBarSection::SELECTOR)

  elements(:sources, "input[type='number']")
  elements(:funding_secured, "input[name$='[secured]'][type='checkbox']", visible: false)
  elements(:funding_constrained, "input[name$='[constrained]'][type='checkbox']", visible: false)
  element(:grand_total, ".grand-total")

  def submit(args = {})
    case args[:funding]
    when :random
      sources.each do |cell|
        cell.set(rand(1..10_000))
      end
      funding_secured.each do |checkbox|
        i = rand(2)
        checkbox.click if i.zero?
      end
      funding_constrained.each do |checkbox|
        i = rand(2)
        checkbox.click if i.zero?
      end
    end
  end

end
