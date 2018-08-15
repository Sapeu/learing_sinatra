# -*- coding: utf-8 -*-
require 'sinatra'

get '/' do
  puts 'GET "/"'
end

post '/' do
  puts 'POST "/"'
end

put '/' do
  puts 'PUT "/"'
end

patch '/' do
  puts 'PATCH "/"'
end

delete '/' do
  puts 'DELETE "/"'
end

options '/' do
  puts 'OPTIONS "/"'
end

link '/' do
  puts 'LINK "/"'
end

unlink '/' do
  puts 'UNLINK "/"'
end

get '/foo' do
  # 不能匹配 GET /foo/
  puts 'GET "/foo"'
end

get '/hello/:name' do
  # 匹配 GET /hello/sapeu 和 GET /hello/paul
  # params[:name] 是参数sapeu 和paul

  "Hello #{params[:name]}"
end

get '/yoyo/:name' do |n|
  # 匹配 GET /hello/sapeu 和 GET /hello/paul
  # params['name'] 是 sapeu 和 paul
  # n stores params['name']
  "Yo! Yo! #{n}"
end

get '/say/*/to/*' do
  # matches /say/hello/to/world
  p params
  params['splat'] # => ['hello', 'world']
end

get '/download/*.*' do
  # matches /download/path/to/file.xml
  p params
  params[:splat] # => ['path/to/file', 'xml']
end

get '/new_download/*.*' do |path, ext|
  [path, ext] # => ['path/to/file', 'xml']
end

get /\/match\_hello\/([\w]+)/ do
  p params
  "Match: Hello, #{params[:captures].first}!"
end

get %r{/new_match_hello/([\w]+)} do |c|
  p params
  "Match: Hello, #{c}!"
end

get '/posts' do
  # matches GET /posts?title=foo&author=bar
  p params
  title = params[:title]
  author = params['author']

  "#{title}-#{author}"
end

get '\A/new\_posts\z', mustermann_opts: { type: :regexp, check_anchors: false } do
  # matches /new_posts exactly, with explicit anchoring
  "If you match an anchored pattern clap your hands!"
end
