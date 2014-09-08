require 'rss'
require 'open-uri'
require 'nokogiri'

class RSSParser
	attr_reader :feed_link, :links_to_articles, :parsed_articles
	def initialize(feed_link)
		@feed_link = feed_link
		@rss_content = ""
		@links_to_articles = []
		@parsed_rss = nil
		@parsed_articles = []
	end

	def parse_rss_feed
		open(feed_link) do |f|
   		@rss_content = f.read
		end
		@parsed_rss = RSS::Parser.parse(@rss_content, false)
	end

	def retrieve_article_links
		@parsed_rss.items.each { |item| @links_to_articles << item.link }
	end

end
