module GenericWebHook
  module Services
    class BaseService < Sinatra::Base

      def self.get(*args, &block)
        super(*args, &block)
      end


    end
  end
end