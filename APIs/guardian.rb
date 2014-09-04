class Guardian

	def self.get_categories
		make_http_request("http://api.feedzilla.com/v1/categories.json")
	end

	def self.get_articles_for_specific_category(selected_category_id)
		make_http_request("http://api.feedzilla.com/v1/categories/#{selected_category_id}/articles.json")
	end

	def self.get_article(article_id)
		make_http_request("http://api.feedzilla.com/v1/categories/#{article_id}/articles.json")
	end

	def self.find_most_common_word
		frequencies = []
		api_hash = JSON.parse(make_http_request("http://api.feedzilla.com/v1/categories/19/articles.json"))
		api_hash["articles"].each { |article| frequencies << create_frequency_tables(article["summary"]) }
		frequencies
	end

	private

	def self.make_http_request(url)
		url = URI.parse(url)
		request = Net::HTTP::Get.new(url.request_uri)
		params = { :order => 'popular' }
		http = Net::HTTP.new(url.host, url.port)
		response = http.request(request)

		response.body
	end

end