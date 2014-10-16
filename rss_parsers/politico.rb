class Politico < RSSParser::Base

	def parse_article_text 
		links_to_articles.each do |article_link|
			doc = Nokogiri::HTML(open(article_link))			
			print_ready_link = doc.at_css('.share-print a').attributes["href"]

			if /\A(http)/.match(print_ready_link.text)
				print_document = Nokogiri::HTML(open(print_ready_link))

				parsed_article = {
					title: doc.css('.story-banner h1').text,
					author: doc.css('.byline a').text,
					date: doc.css('span.date').text,
					body_content: print_document.css('.story').text,
					site: "http://www.Polico.com"
				}
			else
				parsed_article = {
					title: doc.css('.story-banner h1').text,
					author: doc.css('.byline a').text,
					date: doc.css('span.date').text,
					body_content: doc.css('.story-text p-content resize').text,
					site: "http://www.Polico.com"
				}
			end

			parsed_articles << Article.new(parsed_article)
		end
	end

end