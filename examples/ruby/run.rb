require 'sinatra'
require 'gelf'

set :bind, '0.0.0.0'

get '/' do
  logger = GELF::Logger.new("graylog", 12201, "WAN", { :facility => "graylog-talk-example-ruby" })
  logger.debug "index called"

  logger.info "hello world"

  'Hello world!'
end

get '/status' do
  logger = GELF::Logger.new("graylog", 12201, "WAN", { :facility => "graylog-talk-example-ruby" })
  logger.debug 'status was called'
  'OK'
end
