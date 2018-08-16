require 'sinatra'

helpers do
  def bar name
    "#{name}bar"
  end
end

module FooUtils
  def foo name
    "#{name}foo"
  end
end

module YoUtils
  def yo name
    "#{name}yo"
  end
end

helpers FooUtils, YoUtils
