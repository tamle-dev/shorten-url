# LinkService::Creator.new(params).exec
module LinkService
  class Creator
    attr_reader :now, :params

    def initialize(params)
      @now    = Time.zone.now
      @params = params
    end

    def exec
      Link.create(build_params)
    end

    private

    def build_params
      params.merge({
        id:       build_id,
        slug:     build_slug,
        clicked:  0
      })
    end

    def build_id
      (now.to_f * 1000).to_i
    end

    def build_slug
      Base62.encode(build_id)
    end
  end
end
