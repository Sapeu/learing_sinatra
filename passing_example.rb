# -*- coding: utf-8 -*-
require 'sinatra'

# 使用 pass 将处理转移到下个匹配到的路由
get '/guess/:who' do
  pass unless params[:who] == 'Frank'
  'You got me!'
end

get '/guess/*' do
  'You missed!'
end
