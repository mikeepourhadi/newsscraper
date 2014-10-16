class BBC < RSSParser::Base

	def parse_article_text 
		links_to_articles.each do |article_link|
			doc = Nokogiri::HTML(open(article_link))			
			
			parsed_article = {
				title: doc.css('h1.story-header').text,
				author: "BBC",
				date: doc.css('span.date').text,
				body_content: doc.css('.story-body p').text,
				site: "http://www.BBC.com"
			}

			parsed_articles << Article.new(parsed_article)
		end
	end

end