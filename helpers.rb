	def create_frequency_tables(article_summary)
		split_article = article_summary.split
		word_frequency_table = split_article.inject(Hash.new(0)) { |word, frequency| word[frequency] += 1; word }
	end

