require 'pathname'
require 'grape'
require 'net/http'
require 'json'
require 'nokogiri'
require 'open-uri'
require 'rss'

APP_ROOT = Pathname.new(File.expand_path('../../', __FILE__))

# Public Interface
require ::File.expand_path('../../Grape/newsscraper',  __FILE__)

# Parsers
require ::File.expand_path('../../rss_parsers/rss_parser',  __FILE__)
Dir[APP_ROOT.join('rss_parsers', '*.rb')].each { |file| require file }

# APIs
Dir[APP_ROOT.join('APIs', '*.rb')].each { |file| require file }