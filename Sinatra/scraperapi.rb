require './feedzilla'
require 'sinatra'

get '/categories' do
	# get all categories available 
	FeedZilla.get_categories
end

get '/categories/:category_id' do
	# get articles for specific category
	FeedZilla.get_articles_for_specific_category(params[:category_id])
end

get '/articles/:article_id' do
	# get specific article
end
