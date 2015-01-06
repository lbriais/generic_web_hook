module GenericWebHook
  class Server < Sinatra::Base

    bind, port = EasyAppHelper.config[:bind], EasyAppHelper.config[:port]
    Routes = Rack::Mount::RouteSet.new do |set|
      ServiceDefinition.list do |service|
        service.set :bind, bind
        service.set :port, port
        set.add_route service.handler,request_method: service.service_method
      end
    end

    def self.start
      route!
    end


  end
end
