#
class Api::GetLinksController < ::Api::AuthController
  def call
    collection = paging get_links

    render json: CollectionSerializer.new(
      collection,
      ApiSerializer::Link,
      root: :data,
      meta: {
        paging: PagingSerializer.new(collection).to_hash
      },
    ), status: :ok
  end

  private

  def get_links
    Link.active.where(created_by: current_user.id)
  end
end

