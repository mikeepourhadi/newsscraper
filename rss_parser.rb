require 'rss'
require 'open-uri'
require 'nokogiri'

rss_feed = "http://www.npr.org/rss/rss.php?id=1003"

rss_content = ""

open(rss_feed) do |f|
   rss_content = f.read
end

rss = RSS::Parser.parse(rss_content, false)

links = []

rss.items.each { |item| links << item.link }

links.each do |article_link|
	doc = Nokogiri::HTML(open(article_link))
	puts doc.css('#storytext p')
end