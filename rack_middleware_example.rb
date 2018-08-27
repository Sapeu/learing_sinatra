require 'sinatra'
require 'my_custom_middleware'

use Rack::Lint
use MyCustomMiddlware

get '/hello' do
  'Hello World'
end

use Rack::Auth::Basic do |username, password|
  username == 'admin' && password == 'secret'
end
