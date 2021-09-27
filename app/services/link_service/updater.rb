# LinkService::Updater.new(resource, params).exec
module LinkService
  class Updater
    attr_reader :resource, :params

    def initialize(resource, params)
      @resource = resource
      @params   = params
    end

    def exec
      resource.update(params)
      resource
    end
  end
end
