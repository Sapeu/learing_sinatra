require 'sinatra'

Tilt.register :myat, MyAwesomeTemplateEngine

helpers do
  def myat(*args)
    render :myat, *args
  end
end

get '/' do
  myat :index
end
