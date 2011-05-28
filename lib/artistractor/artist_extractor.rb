class ArtistExtractor
  class << self
    def setup
      dictionary = Java::ComAliasiDict::MapDictionary.new
      MusicmetricArtistList.new.artist_names.each do |name|
        dictionary.addEntry(Java::ComAliasiDict::DictionaryEntry.new(name, 'ARTIST', 1.0))
      end
      @chunker = Java::ComAliasiDict::ExactDictionaryChunker.new(dictionary, Java::ComAliasiTokenizer::IndoEuropeanTokenizerFactory::INSTANCE, true, true)
    end
    
    def extract_from_text(text)
      extracted_artists = []
      chunking = @chunker.chunk(text)
      chunking.each do |chunk|
        extracted_artists << text[chunk.start, chunk.end]
      end
      extracted_artists
    end
  end
end
