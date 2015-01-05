module GenericWebHook
  module Services
    class Admin < GenericWebHook::Services::BaseService

      def information
        request.env
      end


      get ('/admin/information') {information }


    end
  end
end