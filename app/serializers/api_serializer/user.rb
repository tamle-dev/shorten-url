# ApiSerializer::User.new(collection, root: :data)
module ApiSerializer
  class User < ResourceSerializer
    attributes  :id,
                :name,
                :email
  end
end
