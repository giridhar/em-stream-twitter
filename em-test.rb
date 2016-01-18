require 'em-http'
require 'em-http/middleware/oauth'
require 'em-http/middleware/json_response'
require 'multi_json'


require 'pp'

OAuthConfig = {
  :consumer_key     => '',
  :consumer_secret  => '',
  :access_token     => '',
  :access_token_secret => ''
}

streams = 'https://stream.twitter.com/1.1/statuses/sample.json'

EM.run do
  
  # EventMachine::HttpRequest.use EventMachine::Middleware::JSONResponse

  # sign the request with OAuth credentials
  conn = EventMachine::HttpRequest.new(streams)
  conn.use EventMachine::Middleware::OAuth, OAuthConfig

  http = conn.get

  buffer = ""
 
  //TODO write callback method 
  
  
  http.errback do
    EM.stop
  end
end

