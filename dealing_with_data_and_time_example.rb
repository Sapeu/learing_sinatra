require 'sinatra'

get '/' do
  pass if Time.now > time_for('Dec 23, 2018')
  'still time'
end

helpers do
  def time_for(value)
    case value
    when :yesterday then Time.now - 24 * 60 * 60
    when :tomorrow then Time.now + 24 * 60 * 60
    else super
    end
  end
end

get '/' do
  last_modified :yesterday
  expires :tomorrow
  'hello'
end
