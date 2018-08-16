require 'sinatra'

get '/foo' do
  body 'bar'
end

after do
  puts body
end

get '/goo' do
  status 418
  headers \
    "Allow" => "BREW, POST, GET, PROPFIND, WHEN",
    "Refresh" => "Refresh: 20; http://www.ietf.org/rfc/rfc2325.txt"
  body "I'm a tea pot!"
end
