Given("I choose to complete the carbon impact section") do
  @app.proposal_overview_page.add_carbon.click
end

Given("I have read the carbon impact guidance") do
  @app.carbon_impact_guidance_page.submit
end

Given(/^I add how much capital carbon will this project produce as "([^"]*)"$/) do |total|
  @capital_carbon = if total == "blank"
                      nil
                    else
                      total.to_f
                    end

  @app.carbon_cost_build_page.submit(
    amount: @capital_carbon
  )
end

Given(/^I add how much operational carbon the project will produce as "([^"]*)"$/) do |total|
  @operational_carbon = if total == "blank"
                          nil
                        else
                          total.to_f
                        end
  @app.carbon_cost_operation_page.submit(
    amount: @operational_carbon
  )
end

Then("I will be shown the whole life carbon total calculated for the project") do
  @whole_life_carbon = if @capital_carbon.nil? && @operational_carbon.nil?
                         nil
                       elsif @capital_carbon.nil?
                         @operational_carbon
                       elsif @operational_carbon.nil?
                         @capital_carbon
                       else
                         (@capital_carbon + @operational_carbon)
                       end
  if @whole_life_carbon.nil?
    puts "Whole life carbon total is Not provided"
  else
    puts "Whole life carbon total is #{@whole_life_carbon}"
  end
  if @whole_life_carbon.nil?
    expect(@app.whole_life_carbon_page.whole_life_carbon).to have_text("Not provided")
  else
    expect(@app.whole_life_carbon_page.whole_life_carbon).to have_text(@whole_life_carbon)
  end
end

Then("I will not be shown the whole life carbon total calculated for the project") do
  expect(@app.whole_life_carbon_page.whole_life_carbon.text).to eq("Not provided")
end

When("I confirm my whole life carbon total") do
  @whole_life_carbon = if @capital_carbon.nil? && @operational_carbon.nil?
                         nil
                       else
                         (@capital_carbon + @operational_carbon)
                       end
  @app.whole_life_carbon_page.submit
end

When("I confirm my net carbon total") do
  @net_carbon = if @capital_carbon.nil? && @operational_carbon.nil? && @sequestered_carbon.nil? && @avoided_carbon.nil?
                  nil
                else
                  (@capital_carbon + @operational_carbon - @sequestered_carbon - @avoided_carbon).round(2)
                end
  @app.carbon_net_total_page.submit
end

Given(/^I add how much sequestered carbon the project will store as "([^"]*)"$/) do |total|
  @sequestered_carbon = if total == "blank"
                          nil
                        else
                          total.to_f
                        end

  @app.carbon_sequestered_page.submit(
    amount: @sequestered_carbon
  )
end

Given(/I add how much carbon the project will avoid as "([^"]*)"$/) do |total|
  @avoided_carbon = if total == "blank"
                      nil
                    else
                      total.to_f
                    end

  @app.carbon_avoided_page.submit(
    amount: @avoided_carbon
  )
end

Given(/I confirm how much net economic benefit is generated from any net carbon savings as "([^"]*)"$/) do |total|
  # If blank don't add a total in the field
  @net_benefit_total = if total == "blank"
                         nil
                       else
                         total
                       end
  @app.carbon_net_benefit_page.submit(
    amount: @net_benefit_total
  )
end

Then("I will be shown the net carbon total for the project") do
  @net_carbon = if @capital_carbon.nil? && @operational_carbon.nil? && @sequestered_carbon.nil? && @avoided_carbon.nil?
                  nil
                else
                  (@capital_carbon + @operational_carbon - @sequestered_carbon - @avoided_carbon).round(2)
                end
  if @net_carbon.nil?
    puts "Net carbon total is Not provided"
    expect(@app.carbon_net_total_page.net_carbon).to have_text("Not provided")
  else
    puts "Net carbon total is #{@whole_life_carbon}"
    expect(@app.carbon_net_total_page.net_carbon).to have_text(@net_carbon)
  end
end

Then("I will see a summary of the project's capital carbon") do
  puts current_url
  if @capital_carbon.nil?
    expect(@app.carbon_summary_page.capital_carbon).to have_text("Not provided")
  else
    expect(@app.carbon_summary_page.capital_carbon).to have_text(@capital_carbon)
  end
end

Then("I will see a summary of the project's operational carbon") do
  if @operational_carbon.nil?
    expect(@app.carbon_summary_page.operational_carbon).to have_text("Not provided")
  else
    expect(@app.carbon_summary_page.operational_carbon).to have_text(@operational_carbon)
  end
end

Then("I will see a summary of the project's whole life carbon") do
  if @whole_life_carbon.nil?
    expect(@app.carbon_summary_page.whole_life_carbon).to have_text("Not provided")
  else
    expect(@app.carbon_summary_page.whole_life_carbon).to have_text(@whole_life_carbon)
  end
end

Then("I will see a summary of the project's sequestered carbon") do
  if @sequestered_carbon.nil?
    expect(@app.carbon_summary_page.sequestered_carbon).to have_text("Not provided")
  else
    expect(@app.carbon_summary_page.sequestered_carbon).to have_text(@sequestered_carbon)
  end

end

Then("I will see a summary of the project's avoided carbon") do
  if @avoided_carbon.nil?
    expect(@app.carbon_summary_page.avoided_carbon).to have_text("Not provided")
  else
    expect(@app.carbon_summary_page.avoided_carbon).to have_text(@avoided_carbon)
  end
end

Then("I will see a summary of the project's net carbon") do
  if @net_carbon.nil?
    expect(@app.carbon_summary_page.net_carbon).to have_text("Not provided")
  else
    expect(@app.carbon_summary_page.net_carbon).to have_text(convert_to_currency_format(@net_carbon))
  end

end

Then("I will see a summary of the project's economic benefit from carbon savings") do
  if @net_benefit_total.nil?
    expect(@app.carbon_summary_page.net_economic_benefit).to have_text("Not provided")
  else
    expect(@app.carbon_summary_page.net_economic_benefit).to have_text(convert_to_currency_format(@net_benefit_total))
  end
end

Then("I will see a summary of the estimated capital cost for the project") do
  expect(@app.carbon_summary_page.capital_cost).to have_text(@last_year_total)
end

Then("I will see a summary of the project's estimated operation and maintenance cost") do
  expect(@app.carbon_summary_page.operational_and_maintenance_cost).to have_text(convert_to_currency_format(@capital_and_maintenance_cost))

end

When("I select to view the carbon impact calculations") do
  @app.carbon_summary_page.submit
end

Then("I will see the capital carbon estimated for the project") do
  if @capital_carbon.nil?
    expect(@app.carbon_impact_calculations_page.capital_carbon).to have_text("Not provided")
  else
    expect(@app.carbon_impact_calculations_page.capital_carbon).to have_text(@capital_carbon)
  end
end

Then("I will see the operational carbon estimated for the project") do
  if @operational_carbon.nil?
    expect(@app.carbon_impact_calculations_page.operational_carbon).to have_text("Not provided")
  else
    expect(@app.carbon_impact_calculations_page.operational_carbon).to have_text(@operational_carbon)
  end
end

Then("I will see the calculated capital carbon baseline as {string}") do |value|
  @capital_carbon_baseline = value
  expect(@app.carbon_impact_calculations_page.capital_carbon_baseline).to have_text(@capital_carbon_baseline)
end

Then("I will see the calculated capital carbon target as {string}") do |value|
  @capital_carbon_target = value
  expect(@app.carbon_impact_calculations_page.capital_carbon_target).to have_text(@capital_carbon_target)
end

Then("I will see the calculated operational carbon baseline as {string}") do |value|
  @operation_baseline_carbon = value
  expect(@app.carbon_impact_calculations_page.operation_baseline_carbon).to have_text(@operation_baseline_carbon)
end

Then("I will see the calculated operational carbon target as {string}") do |value|
  @operation_target_carbon = value
  expect(@app.carbon_impact_calculations_page.operation_target_carbon).to have_text(@operation_target_carbon)
end

Then("I will see the net carbon with blank values calculated estimated for the project") do
  if @capital_carbon.nil?
    @capital_carbon = remove_tonnage(@app.carbon_impact_calculations_page.capital_carbon_baseline.text).to_f
  end
  if @operational_carbon.nil?
    @operational_carbon = remove_tonnage(@app.carbon_impact_calculations_page.operation_baseline_carbon.text).to_f
  end
  @sequestered_carbon = 0.0 if @sequestered_carbon.nil?
  @avoided_carbon = 0.0 if @avoided_carbon.nil?
  expect(@app.carbon_impact_calculations_page.net_carbon_with_blank_values_calculated).to have_text(@capital_carbon + @operational_carbon - @sequestered_carbon - @avoided_carbon)
end

Then("I will see the net carbon estimated for the project") do
  expect(@app.carbon_impact_calculations_page.net_carbon).to have_text(@net_carbon)
end

Then("I will see all the carbon net zero summarised on the project summary page") do
  @app.carbon_impact_calculations_page.submit
  puts current_url
  expect(@app.proposal_overview_page.capital_carbon).to have_text(@capital_carbon)
  expect(@app.proposal_overview_page.capital_carbon_baseline).to have_text(@capital_carbon_baseline)
  expect(@app.proposal_overview_page.capital_carbon_target).to have_text(@capital_carbon_target)
  expect(@app.proposal_overview_page.capital_cost).to have_text(@last_year_total)
  expect(@app.proposal_overview_page.operational_carbon).to have_text(@operational_carbon)
  expect(@app.proposal_overview_page.operation_baseline_carbon).to have_text(@operation_baseline_carbon)
  expect(@app.proposal_overview_page.operation_target_carbon).to have_text(@operation_target_carbon)
  expect(@app.proposal_overview_page.sequestered_carbon).to have_text(@sequestered_carbon)
  expect(@app.proposal_overview_page.avoided_carbon).to have_text(@avoided_carbon)
  expect(@app.proposal_overview_page.net_carbon).to have_text(@net_carbon)
  expect(@app.proposal_overview_page.net_economic_benefit).to have_text(convert_to_currency_format(@net_benefit_total))
end

Given("I complete the carbon net zero section") do
  @app.proposal_overview_page.add_carbon.click
  @app.carbon_impact_guidance_page.submit
  @app.carbon_cost_build_page.submit(
    amount: rand(10..100)
  )
  @app.carbon_cost_operation_page.submit(
    amount: rand(10..100)
  )
  @app.whole_life_carbon_page.submit

  @app.carbon_sequestered_page.submit(
    amount: rand(10..100)
  )
  @app.carbon_avoided_page.submit(
    amount: rand(10..100)
  )
  @app.carbon_net_total_page.submit
  @app.carbon_net_benefit_page.submit(
    amount: rand(10..100)
  )
  @app.carbon_summary_page.submit
  @app.carbon_impact_calculations_page.submit
end

Then("I should informed that I need to complete other sections before I can complete the carbon net zero section") do
  expect(@app.carbon_impact_guidance_page).to have_text("Information we require before you can complete the carbon impact section")
end
