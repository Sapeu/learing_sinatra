require 'sinatra/base'

# use Sinatra.new
my_app = Sinatra.new { get('/') { 'Hi!'} }

# config.ru
controller = Sinatra.new do
  enable :loggin
  helpers MyHelpers
end

map '/a' do
  run Sinatra.new(controller) { get('/') { 'a'} }
end

map '/b' do
  run Sinatra.new(controller) { get('/') { 'b' } }
end


# Using sinatra in rails
use Sinatra do
  get('/') { 'sinatra' }
end

run RailsProject::Application
