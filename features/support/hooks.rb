# -*- encoding : utf-8 -*-

After do |scenario|
  if scenario.status.to_s == 'passed'
    Log.info "Scenario [#{scenario.name.to_s}] status is #{scenario.status.to_s}"
  else
    Log.error "Scenario [#{scenario.name.to_s}] status is #{scenario.status.to_s}"
  end
end

Before do |scenario|
  Log.info "Scenario name: #{scenario.name.to_s}"
end

AfterStep do |step|
  Log.lwarn '=== new step ==='
end

at_exit do

end