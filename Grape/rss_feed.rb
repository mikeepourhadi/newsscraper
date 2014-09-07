rss_feed = "http://feeds.feedburner.com/WJasonGilmore"

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