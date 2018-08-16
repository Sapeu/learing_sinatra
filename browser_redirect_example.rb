require 'sinatra'

get '/foo' do
  redirect to('/bar')
end

get '/bar' do
  redirect to('/goo'), 303
end

get '/goo' do
  redirect 'http://www.google.com', 'wrong place, buddy'
end

get '/luu' do
  haml "%a{href: '/laa'} \n  = Time.now"
end

get '/laa' do
  puts 'GET /laa'
  redirect back
end

get '/suu' do
  redirect to('/bar?sum=43')
end

enable :sessions

get '/see' do
  session[:secret] = 'ioo'
  redirect to('/sii')
end

get '/sii' do
  session[:secret]
end
