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

	def parse!
		self.parse_rss_feed
		self.retrieve_article_links
		self.parse_article_text
	end

	def parse_rss_feed
		open(feed_link) do |f|
   		@rss_content = f.read
		end
		@parsed_rss = RSS::Parser.parse(@rss_content, false)
	end
	protected :parse_rss_feed

	def retrieve_article_links
		@parsed_rss.items.each { |item| @links_to_articles << item.link }
	end
	protected :retrieve_article_links

	def parse_article_text
		#all sub-parsers will have this method, overwritten for the specific rss feed
	end
	protected :parse_article_text

end

# runner for NPR
# npr = NPR.new("http://www.npr.org/rss/rss.php?id=1001")
# npr.parse_rss_feed
# npr.retrieve_article_links
# npr.parse_article_text
# npr.parsed_articles.each { |article| p article }

# runner for BBC
# bbc = BBC.new("http://feeds.bbci.co.uk/news/rss.xml")
# bbc.parse_rss_feed
# bbc.retrieve_article_links
# bbc.parse_article_text
# bbc.parsed_articles.each { |article| p article }

#runner for politico
# politico = Politico.new("http://www.politico.com/rss/politicopicks.xml")
# politico.parse_rss_feed
# politico.retrieve_article_links
# politico.parse_article_text
# politico.parsed_articles.each { |article| p article }

