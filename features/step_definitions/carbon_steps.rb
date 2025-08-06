Given("I select to complete the carbon net zero section") do
  @app.proposal_overview_page.add_carbon.click
end

Given("I have read the carbon impact guidance") do
  @app.carbon_impact_guidance_page.submit
end

Given(/^I add how much capital carbon will this project produce as "([^"]*)"$/) do |total|
  @capital_carbon = if total == "blank"
                      0
                    else
                      total.to_f
                    end
  # If blank don't add a total in the field
  capital_carbon_total = if total == "blank"
                           nil
                         else
                           @capital_carbon
                         end
  @app.carbon_cost_build_page.submit(
    amount: capital_carbon_total
  )
end

Given(/^I add how much operational carbon the project will produce as "([^"]*)"$/) do |total|
  @operational_carbon = if total == "blank"
                          0
                        else
                          total.to_f
                        end

  # If blank don't add a total in the field
  ops_total = if total == "blank"
                nil
              else
                @operational_carbon
              end
  @app.carbon_cost_operation_page.submit(
    amount: ops_total
  )
end

Then("I will be shown the whole life carbon total calculated for the project") do
  puts "Whole life carbon total is #{@capital_carbon + @operational_carbon}"
  expect(@app.whole_life_carbon_page.whole_life_carbon).to have_text(@capital_carbon + @operational_carbon)
end

Then("I will not be shown the whole life carbon total calculated for the project") do
  expect(@app.whole_life_carbon_page.whole_life_carbon.text).to eq("Not provided")
end

When("I confirm my whole life carbon total") do
  @app.whole_life_carbon_page.submit
end

When("I confirm my net carbon total") do
  @app.carbon_net_total_page.submit
end

Given(/^I add how much sequestered carbon the project will store as "([^"]*)"$/) do |total|
  @sequestered_carbon = if total == "blank"
                          0
                        else
                          total.to_f
                        end

  # If blank don't add a total in the field
  seq_total = if total == "blank"
                nil
              else
                @sequestered_carbon
              end
  @app.carbon_sequestered_page.submit(
    amount: seq_total
  )
end

Given(/I add how much carbon the project will avoid as "([^"]*)"$/) do |total|
  @avoided_carbon = if total == "blank"
                      0
                    else
                      total.to_f
                    end

  # If blank don't add a total in the field
  avoid_total = if total == "blank"
                  nil
                else
                  @avoided_carbon
                end
  @app.carbon_avoided_page.submit(
    amount: avoid_total
  )
end

Given(/I confirm how much net economic benefit is generated from any net carbon savings as "([^"]*)"$/) do |total|
  # If blank don't add a total in the field
  @net_benefit_total = if total == "blank"
                         nil
                       else
                         @net_benefit_total
                       end
  @app.carbon_net_benefit_page.submit(
    amount: @net_benefit_total
  )
end

Then("I will be shown the net carbon total for the project") do
  expect(@app.carbon_net_total_page.net_carbon).to have_text((@capital_carbon + @operational_carbon - @sequestered_carbon - @avoided_carbon).round(2))
end

Then("I will not be shown the net carbon total for the project") do
  expect(@app.carbon_net_total_page.net_carbon.text).to eq("Not provided")
end
