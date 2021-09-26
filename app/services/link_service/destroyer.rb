# LinkService::Destroyer.new(resource).exec
module LinkService
  class Destroyer
    attr_reader :resource

    def initialize(resource)
      @resource = resource
    end

    def exec
      resource.update(deleted_at: Time.zone.now)
      resource
    end
  end
end
