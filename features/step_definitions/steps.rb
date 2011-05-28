require 'fakeweb'
require 'rack/test'
require 'cgi'

World(Rack::Test::Methods)

Given /^I've set up '([^']*)' to return '([^']*)'$/ do |url, fixture_path|
  absolute_fixture_path = File.expand_path("../../#{fixture_path}", __FILE__)
  FakeWeb.register_uri(:get, url, :body => absolute_fixture_path)
end

When /^I ask for the text of '([^']*)'$/ do |url|
  get "/textract?url=#{CGI.escape(url)}"
end

Then /^the output should contain:$/ do |table|
  examples = table.raw.map(&:first)
  examples.all?{|ex| last_response.body.include?(ex)}.should == true
end