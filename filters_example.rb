require 'sinatra'

before do
  @note = 'Hi!'
  request.path_info = '/foo/bar/baz'
end

get '/foo/*' do
  @note # => 'Hi!'
  params[:splat] # => 'bar/baz'
end

after do
  puts response.status
end

before 'protected' do
  authenticate!
end

after '/create/:slug' do |slug|
  session[:last_slug] = slug
end

before agent: /Songbird/ do
  # ...
end

after '/blog/*', host_name: 'example.com' do
  # ...
end
