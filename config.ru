# Require config/environment.rb
require ::File.expand_path('../config/environment',  __FILE__)
require ::File.expand_path('../APIs/feedzilla',  __FILE__)
require ::File.expand_path('../APIs/guardian',  __FILE__)
require ::File.expand_path('../Grape/newsscraper',  __FILE__)

run Rack::Builder.new(NewsScraper)
