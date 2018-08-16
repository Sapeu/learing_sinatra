require 'sinatra'

get '/' do
  haml '%div.title Hello world!'
end

get '/set_haml_path' do
  haml '%div.title Hello world!', path: 'examples/file.haml', line: 3
end
