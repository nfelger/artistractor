require File.expand_path('../../../lib/artistractor', __FILE__)

require 'rack/test'
World(Rack::Test::Methods)

require 'rspec'
module RSpecWorld
  include RSpec::Matchers
end
World(RSpecWorld)

module TestApp
  def app
    @app ||= Rack::Builder.new do
      eval IO.read(File.expand_path('../../../config.ru', __FILE__))
    end.to_app
  end
end
World(TestApp)