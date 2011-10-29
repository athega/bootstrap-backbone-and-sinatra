module Jasmine
  class Config

    def start_server(port = 8888)
      server = Rack::Server.new(:Port => port, :AccessLog => [], :server => 'thin')
      server.instance_variable_set(:@app, Jasmine.app(self)) # workaround for Rack bug, when Rack > 1.2.1 is released Rack::Server.start(:app => Jasmine.app(self)) will work
      server.start
    end
  end
end


# Note - this is necessary for rspec2, which has removed the backtrace
module Jasmine
  class SpecBuilder
    def declare_spec(parent, spec)
      me = self
      example_name = spec["name"]
      @spec_ids << spec["id"]
      backtrace = @example_locations[parent.description + " " + example_name]
      parent.it example_name, {} do
        me.report_spec(spec["id"])
      end
    end
  end
end
