class Article
	attr_reader :title, :author, :date, :body_content, :site 
	def initialize(article_details)
		@title = article_details[:title]
		@author = article_details[:author]
		@date = article_details[:date]
		@body_content = article_details[:body_content]
		@site = article_details[:site]
	end

	def to_hash
		hashed_article = {
			title: self.title,
			author: self.author,
			date: self.date,
			body_content: self.body_content,
			site: self.site
		} 
	end

end
