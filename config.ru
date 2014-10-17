# Environment
require ::File.expand_path('../config/environment',  __FILE__)

run Rack::Builder.new(NewsScraper)