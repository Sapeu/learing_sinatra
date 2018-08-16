# -*- coding: utf-8 -*-
require 'sinatra'

# 要将文件扩展名与模板引擎相关联，使用Tilt.register
Tilt.register :tt, Tilt[:textile]
