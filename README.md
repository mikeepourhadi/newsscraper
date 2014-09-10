newsscraper API
===========

This is just a test API to see how much information can be gleaned from RSS feeds. Build on Grape API and Nokogiri to attain original articles and authors. 

Not setup to persist article data. That wouldn't be very ethical, would it?

FEEDS:
BBC
NPR
POLITICO - (still working on this one)

INST:
Clone to desktop, bundle install, run 'rackup config.ru'

CHANGING FEEDS:
There is only one feed in use that can be attained by navigating to localhost:9292/rss - the BBC feed.

To change the feed, go to Grape > newsscraper.rb and change the methods, instantiating an available feed class (NPR, BBC, POLITICO).
Don't forget to change the feed URL! 

Find them here: 
BBC: http://www.bbc.com/news/10628494
NPR: http://www.npr.org/rss/ 

-------------------------------------

You'll notice an API folder, and methods on the NewsScraper class using those methods ('resource :categories'). 
Those aren't done.
Don't do things with those.
