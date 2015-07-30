# -*- encoding : utf-8 -*-

After do |scenario|
  if scenario.status.to_s == 'passed'
    Log.debug "Scenario [#{scenario.name.to_s}] status is" + " #{scenario.status.to_s}".upcase!
  else
    Log.error "Scenario [#{scenario.name.to_s}] status is #{scenario.status.to_s}".upcase!
  end
end

Before do |scenario|
  Log.info "Scenario name: #{scenario.name.to_s}".upcase!
end

AfterStep do |step|

end

at_exit do

end