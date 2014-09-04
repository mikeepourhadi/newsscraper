class NewsScraper < Grape::API	
	format :json	

	resource :categories do
		desc "Returns a list of possible news categories"
		get do
			FeedZilla.get_categories
		end
	
		desc "Returns a list of articles for the specified category ID"
		params do
      requires :category_id, type: Integer, desc: "category id."
    end
    route_param :category_id do
			get do
				JSON.parse(FeedZilla.get_articles_for_specific_category(params[:category_id]))
			end
		end
	end

	resource :articles do
		desc "Returns an article from an article ID"
		get :article_id do

		end
	end

end