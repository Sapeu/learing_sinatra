require 'sinatra/base'

# You have the request scope binding inside:
# get, head, post, put, delete, options, patch, link and unlink blocks
# before and after filters
# helper methods
# templates/views

class MyApp < Sinatra::Base
  # Hey, I'm in the application scope!

  get '/define_route/:name' do
    # Request scope for '/define_route/:name'
    @value = 42
    settings.get "/#{params['name']}" do
      # Request scope for "/#{params['name']}"
      @value # => nil (not the same request)
    end
    'Route defined'
  end
end
