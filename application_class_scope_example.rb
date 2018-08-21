require 'sinatra/base'

# You have the application scope binding inside:
# Your application class body
# Methods defined by extensions
# The block passed to helpers
# Procs/blocks used as value for set
# The block passed to Sinatra.new

# You can reach the scope object (the class) like this:
# Via the object passed to configure blocks (configure { |c| ... })
# settings from within the request scope
class MyApp < Sinatra::Base
  # Hey, I'm in the applcation scope!
  set :foo, 42
  foo # => 42

  get '/foo' do
    # Hey, I'm no longer in the application scope!
  end
end
