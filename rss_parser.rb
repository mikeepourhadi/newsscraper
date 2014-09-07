require 'rss'
require 'open-uri'
require 'nokogiri'

rss_feed = "http://www.npr.org/rss/rss.php?id=1003"

rss_content = ""

open(rss_feed) do |f|
   rss_content = f.read
end

# Parse the feed, dumping its contents to rss
rss = RSS::Parser.parse(rss_content, false)

# Output the feed title and website URL
puts "Title: #{rss.channel.title}"
puts "RSS URL: #{rss.channel.link}"
puts "Total entries: #{rss.items.size}"

links = []

rss.items.each { |item| links << item.link }

puts links