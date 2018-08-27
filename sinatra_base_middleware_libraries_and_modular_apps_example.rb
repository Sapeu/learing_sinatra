require 'sinatra/base'

class MyApp < Sinatra::Base
  set :sessions, true
  set :foo, 'bar'

  get '/' do
    'Hello world!'
  end
end

class MyApp < Sinatra::Application
  get '/' do
    'Hello world!'
  end
end
