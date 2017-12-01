require 'sinatra'
require 'gelf'

VERSION = '0.0.9'

set :bind, '0.0.0.0'

get '/' do
  logger = GELF::Logger.new("graylog", 12201, "WAN", { :facility => "graylog-talk-example-ruby" })
  logger.debug "index called"

  logger.info "hello world"

  logger.add GELF::INFO, {
      :short_message => 'random_counter',
      :random_counter_value => Random.rand(11),
      :app_version => VERSION
  }

  'Hello world!'
end

get '/status' do
  logger = GELF::Logger.new("graylog", 12201, "WAN", { :facility => "graylog-talk-example-ruby" })
  logger.debug 'status was called'

  logger.add GELF::INFO, {
      :short_message => 'random_counter',
      :random_counter_value => Random.rand(11),
      :app_version => VERSION
  }

  'OK'
end
