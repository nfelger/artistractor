require 'json'
require 'open-uri'

class MusicmetricArtistList
  JSON_URL = 'http://apib2.semetric.com/artist/?token=bbc004e8891211e0ba8f00163e499d92'
  attr_reader :artist_names

  def initialize
    json_response = nil
    open(JSON_URL) do |f|
      json_response = f.read
    end
    response = JSON.parse(json_response)
    @artist_names = response['response']['artists'].map{|artist| artist['name']}
  end
end
