require 'sinatra'

enable :sessions

get '/' do
  "value = " << session[:value].inspect
end

get '/:value' do
  session[:value] = params[:value]
end

# Session Secret Generation
# ruby -e "require 'securerandom'; puts SecureRandom.hex(64)"

# Session Secret Generation(Binus Points)
# gem install sysrandom
# ruby -e "require 'sysrandom/securerandom'; puts SecureRandom.hex(64)"

# Session Secret Environment Variable
# echo "export SESSION_SECRET=asdf..asdfasdf..asdf >> ~/.bashrc"

# Session Secret App Config
# if the SESSION_SECRET environment variable is not available
require 'securerandom'
# -or- require 'sysrandom/securerandom'
set :session_secret, ENV.fetch('SESSION_SECRET') { SecureRandom.hex(64) }

# Session Config
set :session, domain: 'foo.com'
# subdomains
set :session, domain: '.foo.com'

# Choosing Your Own Session Middleware
# use Rack session
enable :sessions
set :session_store, Rack::Sesssion::Pool

# OR

set :sessions, expire_after: 2592000
set :session_store, Rack::Sesssion::Pool

# Another option is to not call enable :sessions, but instead pull in your middleware of choice as you would any other middleware, session based protection will not be enabled by default
use Rack::Sesssion::Pool, expire_after: 2592000
use Rack::Protection::RemoteToken
use Rack::Protection::SessionHijacking
