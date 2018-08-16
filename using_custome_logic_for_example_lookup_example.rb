require 'sinatra'

configure do
  set :views ['./view/a', './views/b']
end

def find_template(views, name, engine, &block)
  Array(views).each do |v|
    supper(v, name, engine, &block)
  end
end
