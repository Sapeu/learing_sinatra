require 'sinatra'

get '/' do
  cache_control :public
  'cache it!'
end

before do
  expires 500, :public, :must_revalidate
end

get '/article/:id' do
  @article = Article.find params[:id]
  last_modified @article.updated_at
  etag @article.sha1
  # weak Etag
  etag @article.sha1, :weak
  erb :article
end

require "rack/cache"
use Rack::Cache
get '/' do
  cache_control :public, max_age => 36000
  sleep 5
  "hello"
end

get '/create' do
  etag '', new_resource: true # kind: weak
  Article.create
  erb :new_article
end
