require 'easy_app_helper'

require 'sinatra/base'
require 'sinatra/json'
require 'sinatra/namespace'

require 'generic_web_hook/version'
require 'generic_web_hook/urls'
require 'generic_web_hook/services/base_service'
require 'generic_web_hook/services/admin'
require 'generic_web_hook/services/script_runner'
require 'generic_web_hook/services/gitlab'
require 'generic_web_hook/service_definition'
require 'generic_web_hook/server'


module GenericWebHook

  def self.start_server
    EasyAppHelper.puts_and_logs 'Starting the server'
    GenericWebHook::Server.set :bind, EasyAppHelper.config[:bind]
    GenericWebHook::Server.set :port, EasyAppHelper.config[:port]
    GenericWebHook::Server.run!
  end

end

