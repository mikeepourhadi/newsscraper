require 'rss'
require 'open-uri'
require 'nokogiri'

class RSSParserSuperclass
	attr_reader :feed_link, :links_to_articles
	def initialize(feed_link)
		@feed_link = feed_link
		@rss_content = ""
		@links_to_articles = []
		@parsed_rss = nil
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

	def parse_article_text 
		links_to_articles.each do |article_link|
			doc = Nokogiri::HTML(open(article_link))
			puts doc.css('#storytext p').methods
		end
	end

end

rss = RSSParserSuperclass.new("http://www.npr.org/rss/rss.php?id=1003")
rss.parse_rss_feed
rss.retrieve_article_links
rss.parse_article_text