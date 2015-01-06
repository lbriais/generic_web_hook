module GenericWebHook
  module Services
    module Admin

      def self.registered(app)

      end

      def information
        request.env
      end


      get ('/admin/information') {information }


    end
  end
end