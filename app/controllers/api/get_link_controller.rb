#
class Api::GetLinkController < ::Api::AuthController
  before_action :set_link

  def call
    unless @link
      render_t_error(:resource_not_found)
      return
    end

    render json: ApiSerializer::Link.new(@link, root: :data), status: :ok
  end

  private

  def set_link
    @link = LinkService::Parser.new(params[:slug]).exec
  end
end

