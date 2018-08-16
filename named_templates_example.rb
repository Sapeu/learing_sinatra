require 'sinatra'

template :layout do
  "%html\n  %body= yield\n"
end

template :index do
  "%div.title Index action\n%div.message Hello world!"
end

get '/' do
  haml :index
end

get '/index' do
  haml :index, layout: !request.xhr?
end
