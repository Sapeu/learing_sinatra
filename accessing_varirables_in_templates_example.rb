require 'sinatra'

get '/:id' do
  @foo = Foo.find(params[:id])
  haml '%h1= @foo.name'
end

get '/:id' do
  foo = Foo.find(params['id'])
  haml '%h1= bar.name', locals: { bar: foo }
end
