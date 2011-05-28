require "rubygems"
require "bundler"
Bundler.setup

$LOAD_PATH << File.expand_path("../artistractor", __FILE__)

require 'sinatra/base'
require "textractor"

class Artistractor < Sinatra::Base
  get '/textract' do
    Textractor.textract params[:url]
  end
end