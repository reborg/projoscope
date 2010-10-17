Given /^the name is "([^"]*)"$/ do |name|
  @name = name.gsub(/ /, "-").downcase
end

When /^I add the lighthouse project name to the address bar$/ do
  visit("http://localhost:3000/lighthouse/rails/#{@name}")
end

When /^I add the lighthouse user to the address bar/ do
  visit("http://localhost:3000/lighthouse/#{@name}")
end

When /^I add the name to the address bar$/ do
  visit("http://localhost:3000/#{@name}")
end
