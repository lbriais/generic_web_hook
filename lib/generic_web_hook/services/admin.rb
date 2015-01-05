module GenericWebHook
  module Services
    class Admin < GenericWebHook::Services::BaseService

      def information
        request.env
      end

    end
  end
end