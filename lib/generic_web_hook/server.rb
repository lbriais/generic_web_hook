module GenericWebHook
  class Server < Sinatra::Base
    register Sinatra::Namespace

    include GenericWebHook::Urls

    # namespace base_url do
    #   helpers Sinatra::JSON
    #
    #
    #
    # end

    # GenericWebHook::Service.list.each





  end
end