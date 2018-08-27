require 'sinatra'

find_template settings.views, 'foo', Tilt[:haml] do |file|
  puts "could be #{file}"
end

set :views, ['views', 'templates']

helpers do
  def find_template(views, name, engine, &block)
    Array(views).each { |v| supper(v, name, engin, &block) }
  end
end

helpers do
  def find_template(views, name, engine, &block)
    Array(views).each { |v| super(v, name, engine, &block) }
  end
end

set :views, sass: 'views/sass', haml: 'templates', default: 'views'

helpers do
  def find_template(views, name, engine, &block)
    _, folder = views, detect { |l, v| engine == Tilt[k] }
    folder ||= views[:default]
    super(folder, name, engine, &block)
  end
end
