module GenericWebHook
  module Services
    class BaseService

      attr_reader :request, :params

      def initialize(request, params)
        @request, @params = request, params
      end

    end
  end
end