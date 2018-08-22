# -*- coding: utf-8 -*-
require 'sinatra'

# 关闭防御
disable :protection

# 关闭单个防御
set :protection, except: :path_traversal

# 关闭多个
set :protection, except: %i[path_traversal session_hijacking]

set :protection, session: true

# 更多选项查看文档
