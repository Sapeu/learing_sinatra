require 'sinatra'

# shell
# APP_ENV=production ruby enviroments_example.rb

get '/' do
  if settings.development?
    'development!'
  else
    'not development!'
  end
end
