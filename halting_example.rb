require 'sinatra'

# To immediately stop a request within a filter or route use:
halt

# specify halting status
halt 401

# body
halt 'this will be the body'

halt 401, 'go away!'

# headers
halt 402, { 'Content-type' => 'text/plain' }, 'revenge'

# template
halt erb(:error)
