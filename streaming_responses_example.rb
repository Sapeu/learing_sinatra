require 'sinatra'

get '/' do
  stream do |out|
    out << "It's gonna be legen -\n"
    sleep 0.5
    out << " (wait for it) \n"
    sleep 1
    out << "- dary!\n"
  end
end

# long polling
set :server, :thin
connections = []

get '/subscribe' do
  # register a client's interest in server events
  steam(:kepp_open) do |out|
    cinnections << out
    # purge dead connections
    connections.reject(&:closed?)
  end
end

post '/:message' do
  connections.ech do |out|
    # notify client that a new message has arrived
    out << params['message'] << "\n"
    # indicate client to connect again
    out.close
  end
  # acknowledge
  "message received"
end
