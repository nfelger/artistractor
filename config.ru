require 'sinatra'

# Include library jars.
jars_path = File.expand_path("../vendor/jars", __FILE__)
Dir["#{jars_path}/*.jar"].each{|jar| require jar}

require File.expand_path('../lib/artistractor.rb', __FILE__)

disable :run
run Artistractor