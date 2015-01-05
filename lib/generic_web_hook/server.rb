module GenericWebHook
  class Server < Sinatra::Base

    register Sinatra::Namespace

    GenericWebHook::ServiceDefinition.list.each do |service_definition|

      namespace service_definition.namespace do

        send(service_definition.service_method, service_definition.method_path) do
          handler = service_definition.handler.new request, params
          EasyAppHelper.logger.debug "Call of #{service_definition.to_url} -> #{params}"
#          helpers do
          body (json handler.send service_definition.name)
#          end
          EasyAppHelper.logger.debug "Resp headers: #{headers}"
          EasyAppHelper.logger.debug "Resp body: #{body}"
        end
      end

    end

  end
end