require 'sinatra'

# defautl views directory is ./views, set views directory
# set :views, settings.root + 'templates'
get '/' do
  erb :index
end

get '/now_time' do
  now = "Now time: <%= Time.now %>"
  erb now
end

get '/posts/' do
  erb :index, layout: :post
end

get '/format_html5' do
  haml :index, format: :html5
end

set :haml, format: :html5
get '/index' do
  haml :index
end
