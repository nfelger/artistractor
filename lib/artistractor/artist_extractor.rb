class ArtistExtractor
  class << self
    def setup
      dictionary = Java::ComAliasiDict::MapDictionary.new
      @mbids = {}
      MusicmetricArtistList.new.artists.each do |artist|
        dictionary.addEntry(Java::ComAliasiDict::DictionaryEntry.new(artist['name'], 'ARTIST', 1.0))
        @mbids[artist['name'].downcase] = artist['musicbrainz']
      end
      @chunker = Java::ComAliasiDict::ExactDictionaryChunker.new(dictionary, Java::ComAliasiTokenizer::IndoEuropeanTokenizerFactory::INSTANCE, true, true)
    end
    
    def extract_from_text(text)
      java_string = Java::JavaLang::String.new(text)
      chunking = @chunker.chunk(text)

      artist_names = []
      chunking.each do |chunk|
        artist_names << java_string.substring(chunk.start,chunk.end)
      end

      artist_names.sort.uniq.map do |artist_name|
        {:name => artist_name, :mbid => @mbids[artist_name.downcase]}
      end
    end
  end
end
