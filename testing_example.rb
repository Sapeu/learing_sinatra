require 'sinatra'
require './condtions_example.rb'
require 'minitest/autorun'
require 'rack/test'

class MyAppTest < Minitest::Test
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  def test_my_app
    get '/'
    assert_equal 'Hello Wrold!', last_response.body
  end

  def test_with_params
    get '/meet', name: 'Frank'
    assert_equal 'Hello Frank!', last_response.body
  end

  def test_with_user_agent
    get '/', {}, 'HTTP_USER_AGENT' => 'Songbird'
    assert_equal "You're using Songbird!", last_response.body
  end
end
