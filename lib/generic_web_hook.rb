require 'easy_app_helper'

require 'sinatra/base'
require 'sinatra/json'
require 'sinatra/namespace'

require 'rack/mount'

require 'generic_web_hook/version'
require 'generic_web_hook/services/base_service'
require 'generic_web_hook/services/admin'
require 'generic_web_hook/services/script_runner'
require 'generic_web_hook/services/gitlab'
require 'generic_web_hook/service_definition'


module GenericWebHook



  def self.start_server
    EasyAppHelper.puts_and_logs 'Starting the server'
    bind, port = EasyAppHelper.config[:bind], EasyAppHelper.config[:port]
    routes = Rack::Mount::RouteSet.new do |set|
      ServiceDefinition.list do |service|
        service.set :bind, bind
        service.set :port, port
        set.add_route service.handler,request_method: service.service_method
      end
    end
    run routes
  end

end

