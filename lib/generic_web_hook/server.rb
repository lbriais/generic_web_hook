module GenericWebHook
  class Server < Sinatra::Base

    register Sinatra::Namespace

#    namespace EasyAppHelper.config[:base_url] do
      GenericWebHook::Service.list.each do |service|

        namespace service.namespace do
          # helpers Sinatra::JSON

          send(service.service_method, service.method_path) do
            handler = service.handler.new request, params
            json (handler.send service.name)
          end
        end

      end
#    end

  end
end