# LinkService::Parser.new(slug).exec
module LinkService
  class Parser
    attr_reader :slug

    def initialize(slug)
      @slug = slug
    end

    def exec
      id = decode_slug

      Link.active.find_by(id: id)
    end

    private

    def decode_slug
      Base62.decode(slug)
    end
  end
end
