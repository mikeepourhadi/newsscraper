require_relative 'rss_parser.rb'
require_relative 'article.rb'

class NPR < RSSParser

	def parse_article_text 
		links_to_articles.each do |article_link|
			doc = Nokogiri::HTML(open(article_link))
			
			parsed_article = {
				title: doc.css('.storytitle h1').text,
				author: doc.css('.byline span').text,
				date: doc.css('.date').text,
				body_content: doc.css('#storytext p').text,
				site: "http://www.NPR.org"
			}

			parsed_articles << Article.new(parsed_article)
		end
	end

end

rss = NPR.new("http://www.npr.org/rss/rss.php?id=1003")
rss.parse_rss_feed
rss.retrieve_article_links
rss.parse_article_text
rss.parsed_articles.each { |article| p article.class }