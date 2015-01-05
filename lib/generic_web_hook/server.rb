module GenericWebHook
  class Server < Sinatra::Base

    register Sinatra::Namespace

#    namespace EasyAppHelper.config[:base_url] do
      GenericWebHook::Service.list.each do |service|

        namespace service.namespace do
          # helpers Sinatra::JSON

          send(service.service_method, service.method_path) { service.handler_module.send service.name }
        end

      end
#    end

  end
end