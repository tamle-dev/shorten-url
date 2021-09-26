# ApiSerializer::Link.new(collection, root: :data)
module ApiSerializer
  class Link < ApiSerializer::Resource
    attributes  :id,
                :url,
                :slug,
                :clicked,
                :shorten_url
  end
end
