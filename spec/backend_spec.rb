require_relative 'spec_helper'
require_relative '../backend.rb'

describe "root" do
  it "responds with a success status" do
    get '/'
    last_response.status.must_equal 200
  end
end
