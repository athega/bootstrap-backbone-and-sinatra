ENV['RACK_ENV'] = 'test'

require 'bundler'

Bundler.require

require 'minitest/pride'
require 'minitest/autorun'
require 'minitest/spec'
require 'rack/test'

include Rack::Test::Methods

def parse_json(body)
  Yajl::Parser.parse(body)
end

def get_json(path, query_params = {})
  get path, query_params
  parse_json(last_response.body)
end

def app
  Backend
end
