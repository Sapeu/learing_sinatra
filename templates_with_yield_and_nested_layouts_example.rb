require 'sinatra'

# This code is mostly equivalent to erb :index, layout: :post
erb :post, layout: false do
  erb :index
end

erb :main_layout, layout: false do
  erb :admin_layout do
    erb :user
  end
end

erb :admin_layout, layout: :main_layout do
  erb :user
end
