require 'sinatra'

get '/' do
  logger.info "loadding data"
end

# logging config
class MyApp < Sinatra::Base
  configure :production, :development do
    enable :logging
  end
end
