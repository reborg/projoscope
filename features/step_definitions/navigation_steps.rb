Given /^the project name is "([^"]*)"$/ do |project_name|
  @project_name = project_name
end

When /^I fill in the name in the address bar and hit return$/ do
  visit("http://localhost:3000/" + @project_name)
end
