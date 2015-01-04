module GenericWebHook
  class Service

    include EasyAppHelper

    attr_reader :name, :path, :method, :handler_module

    def initialize(namespace, service_name, service_properties)
      raise 'Invalid namespace for the service' if namespace.nil?
      @handler_module = GenericWebHook::Services.const_get namespace.camelize
      raise 'Invalid service name' unless @handler_module.respond_to? service_name
      @name = service_name
      @path = service_properties['path']
      @path ||= "/#{namespace}"
      @method = service_properties['method']
      @method ||= :post
      @method = @service_method.to_s
    end

    def to_s
      "name: #{name}, path: #{path}, method: #{method}, handler_module: #{handler_module}"
    end

    def self.list
      services = []
      EasyAppHelper.config[:services].each_pair do |namespace, name_space_definitions|
        # service = {key: key}
        # service[:name] = service_definition[:name] if service_definition[:name]
        # service[:path] = service_definition[:path] if service_definition[:path]
        # service[:method] = service_definition[:method] if service_definition[:method]
        # service[:handler] = service_definition[:handler] if service_definition[:handler]
        name_space_definitions.each_pair do |service_name, service_properties|
          services << self.new(namespace, service_name, service_properties)
        end

      end
      services
    end

  end
end

