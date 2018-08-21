require 'sinatra'

get '/' do
  attachment
  'store it!'
end

get '/info' do
  attachment 'attachments_example.rb'
  'store it!'
end
