module GenericWebHook
  class Server < Sinatra::Base
    register Sinatra::Namespace

    include GenericWebHook::Urls

  end

  def self.start_server
    EasyAppHelper.puts_and_logs 'Starting the server'
    GenericWebHook::Server.set :bind, EasyAppHelper.config[:bind]
    GenericWebHook::Server.set :port, EasyAppHelper.config[:port]
    GenericWebHook::Server.run!

  end

end