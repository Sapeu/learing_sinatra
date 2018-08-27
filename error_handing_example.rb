require 'sinatra'

# 404
not_found do
  'This is nowhere to be found.'
end

set :show_exceptions, :after_handler

error do
  'Sorry there was a nasty error -' + env['sinatra.error'].message
end

class MyCustomError < StandardError; end

error MyCustomError do
  'So what happened was ...' + env['sinatra.error'].message
end

get '/' do
  raise MyCustomError, 'something bad'
end

error 403 do
  'Access forbidden'
end

get '/secret' do
  403
end

error 500..600 do
  'Boom'
end
