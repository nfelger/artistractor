require 'cgi'

When /^I ask for the text of '([^']*)'$/ do |url|
  absolute_fixture_path = File.expand_path("../../#{url}", __FILE__)
  get "/textract?url=file://#{CGI.escape(absolute_fixture_path)}"
end

Then /^the output should contain:$/ do |table|
  examples = table.raw.map(&:first)
  examples.each do |example|
    last_response.body.should =~ Regexp.new(Regexp.escape(example))
  end
end