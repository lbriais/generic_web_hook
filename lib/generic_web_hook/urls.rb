module GenericWebHook
  module Urls
    # BASE_URL = '/abm_remote'
    #
    # SERVICES = {
    #     get: [:information, :simulation],
    #     put: [:simulation],
    #     post: [:simulation, :create_schema, :transfer]
    # }

    module ClassMethods

      def base_url
        EasyAppHelper.config[base_url]
      end

      def urls
        all_urls = {}
        # SERVICES.values.flatten.sort.uniq.each {|u| all_urls[u] = "/#{u}"}
        GenericWebHook.services
        all_urls
      end

      def namespaced_urls
        urls.map { |name, url| [name, "#{base_url}#{url}"] }.to_h
      end

      def url(end_point, mode=nil)
        url_set = mode == :namespaced ? namespaced_urls : urls
        url_set[end_point]
      end

    end

    def self.included(base)
      base.extend(ClassMethods)
    end

  end
end