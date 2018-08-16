require 'sinatra'

get '/' do
  haml :index
end

__END__
@@ layout
%html
  %body= yield

@@ index
%div.title Hello world!
