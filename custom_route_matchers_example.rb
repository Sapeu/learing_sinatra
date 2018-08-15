require 'sinatra'

class AllButPattern
  Match = Struct.new(:captures)

  def initialize(except)
    @except = except
    @captures = Match.new([])
  end

  def match(str)
    @captures unless @except === str
  end
end

def all_but(pattern)
  AllButPattern.new(pattern)
end

get all_but('/index') do
  puts "GET all_but /index"
end

# Note that the above example might be over-engineered, as it can also be expressed as

# get // do
#   pass if request.path_info == '/index'
#   # ...
# end

# get %r{?!/index} do
#   # ...
# end
