class NPR < RSSParser::Base

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

