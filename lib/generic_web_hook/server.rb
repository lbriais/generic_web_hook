module GenericWebHook
  class Server < Sinatra::Base
    register Sinatra::Namespace

#     include GenericWebHook::Urls

    # namespace base_url do
    #   helpers Sinatra::JSON
    #
    #
    #
    # end


    namespace EasyAppHelper.config[:base_url] do
      GenericWebHook::Service.list.each do |service|

        namespace service.namespace do
          helpers Sinatra::JSON




        end

      end
    end

  end
end