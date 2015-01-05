module GenericWebHook
  class ServiceDefinition

    include EasyAppHelper

    attr_reader :name, :path, :service_method, :handler

    def initialize(namespace, service_name, service_properties)
      raise 'Invalid namespace for the service' if namespace.nil?
      @handler = GenericWebHook::Services.const_get namespace.camelize
      raise 'Invalid service name' unless @handler.method_defined? service_name
      @name = service_name
      @path = service_properties['path']
      @path ||= "#{namespace}"
      @service_method = service_properties['method']
      @service_method ||= :post
      @service_method = @service_method.to_s
    end

    def namespace
      "/#{path}"
    end

    def method_path
      "/#{name}"
    end

    def to_url
      base = config[:base_url].gsub /\/$/, ''
      "#{base}/#{path}/#{name}"
    end

    def to_s
      "method: #{service_method}, path: #{path}, name: #{name}, handler: #{handler}"
    end

    def self.list
      services = []
      return services unless EasyAppHelper.config[:services]
      EasyAppHelper.config[:services].each_pair do |namespace, name_space_definitions|
        name_space_definitions.each_pair do |service_name, service_properties|
          services << self.new(namespace, service_name, service_properties)
        end

      end
      services
    end

  end
end

