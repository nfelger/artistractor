require "rubygems"
require "bundler"
Bundler.setup

require "sinatra"

get '/hi' do
  "Hello World!"
end