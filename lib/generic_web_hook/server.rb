module GenericWebHook
  class Server < Sinatra::Base

    register Sinatra::Namespace

    GenericWebHook::ServiceDefinition.list.each do |service_definition|

      namespace service_definition.namespace do

        send(service_definition.service_method, service_definition.method_path) do
          handler = service_definition.handler.new request, params
          EasyAppHelper.logger.debug "Call of #{service_definition.to_url} -> #{params}"
          json (handler.send service_definition.name)
        end
      end

    end

  end
end