require 'sinatra'

class Steam
  def each
    100.times { |i| yield "#{i} \n" }
  end
end

get('/') { Steam.new }
