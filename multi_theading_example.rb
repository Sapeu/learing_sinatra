require 'sinatra/base'

class App < Sinatra::Base
  get '/' do
    'Hello,World!'
  end
end

# start server command
# thin --threaded start
