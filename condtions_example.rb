require 'sinatra'

get '/foo', agent: /Songbird (\d\.\d)[\d\/]*?/ do
  p params
  "You're using Songbird version #{params[:agent][0]}"
end

get '/foo' do
  p params
  # Matches non-songbird browsers
  "non-songbird"
end

get '/', host_name: /^admin\./ do
  "Admin Area, Access Denied!"
end

get '/', provides: 'html' do
  haml :index
end

get '/', provides: %w[rss atom xml] do
  builder :feed
end

set(:probability) { |value| condition { rand <= value } }

get '/win_a_car', probability: 0.1 do
  p params
  "You won!"
end

get '/win_a_car' do
  "Sorry, you lost."
end

set(:auth) do |*auth| # notice the splat here
  condition do
    unless logged_in? && auth.any? { |role| in_role? role }
      redirect "/login/", 303
    end
  end
end

def logged_in?(sign=params[:sign])
  !sign.nil? && !sign.empty?
end

def current_user
  params[:sign]
end

def in_role?(role)
  role.to_s == current_user
end

get '/login/' do
  "Not login!"
end

get '/my/account/', auth: %i[user admin] do
  "Your Account Details"
end

get '/only/admin/', auth: :admin do
  "Only admins are allowed here!"
end
