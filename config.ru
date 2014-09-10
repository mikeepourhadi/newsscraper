# Environment
require ::File.expand_path('../config/environment',  __FILE__)

# Feedzilla API
require ::File.expand_path('../APIs/feedzilla',  __FILE__)

# Guardian API
require ::File.expand_path('../APIs/guardian',  __FILE__)

# External API
require ::File.expand_path('../Grape/newsscraper',  __FILE__)

# Superclass for RSS parsers
require ::File.expand_path('../rss_parsers/rss_parser', __FILE__)

run Rack::Builder.new(NewsScraper)