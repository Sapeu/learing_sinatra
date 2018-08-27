require 'sinatra'

get '/' do
  send_file 'sending_files_example.rb' # , type: :png
end

# # options
# filename
# File name to be used in the response, defaults to the real file name.

# last_modified
# Value for Last-Modified header, defaults to the file's mtime.

# type
# Value for Content-Type header, guessed from the file extension if missing.

# disposition
# Value for Content-Disposition header, possible values: nil (default), :attachment and :inline

# length
# Value for Content-Length header, defaults to file size.

# status
# Status code to be sent. Useful when sending a static file as an error page. If supported by the Rack handler, other means than streaming from the Ruby process will be used. If you use this helper method, Sinatra will automatically handle range requests.
