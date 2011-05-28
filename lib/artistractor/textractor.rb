require 'java'

module Textractor
  def self.textract(url_string)
    url = Java::JavaNet::URL.new(url_string)
    Java::DeL3sBoilerpipeExtractors.DefaultExtractor::INSTANCE.getText(url)
  end
end
