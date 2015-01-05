module GenericWebHook
  module Services
    class Gitlab < GenericWebHook::Services::BaseService

      def push_request


        {message: 'Not yet implemented', request: request.body.to_s}
      end

      def push_request_get
        push_request
      end

    end
  end
end