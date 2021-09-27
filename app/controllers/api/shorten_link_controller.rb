#
class Api::ShortenLinkController < ::Api::AuthController
  def call
    form = LinkForm.new(permitted_params)
    unless form.valid?
      render_form_error(form)
      return
    end

    link = LinkService::Creator.new(permitted_params.merge(created_by: current_user_id)).exec

    render json: ApiSerializer::Link.new(link, root: :data), status: :created
  end

  private

  def permitted_params
    params.permit(:url)
  end
end
