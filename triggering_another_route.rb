require 'sinatra'

get '/foo' do
  status, headers, body = call env.merge('PATH_INFO' => '/bar')
  [status, headers, body.map(&:upcase)]
end

get '/goo' do
  status, headers, body = call! env.merge('PATH_INFO' => '/bar')
  [status, headers, body.map(&:upcase)]
end

get '/bar' do
  "bar"
end
