require "rubygems"
require "bundler"
Bundler.setup

$LOAD_PATH << File.expand_path("../artistractor", __FILE__)

require 'sinatra/base'
require "textractor"

require 'musicmetric_artist_list'
require 'artist_extractor'

ArtistExtractor.setup

class Artistractor < Sinatra::Base
  get '/textract' do
    text = Textractor.textract params[:url]
    ArtistExtractor.extract_from_text(text).to_json()
  end
end
