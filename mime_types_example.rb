require 'sinatra'

configure do
  mime_type :foo, 'text/foo'
end

get '/' do
  content_type :foo
  "foo foo foo"
end
