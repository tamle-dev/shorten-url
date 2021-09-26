#
class LinksController < ResourcesController
  def access
    link = parse_slug

    unless link
      return redirect_to root_path
    end

    increase_clicked(link)

    redirect_to link.url
  end

  protected

  def klass
    Link.active.where(created_by: current_user.id)
  end

  def permitted_params
    params.require(:resource).permit(:url, :created_by, :updated_by)
  end

  def set_default_filters
    super
    params[:q][:deleted_at_null] ||= '1'
  end

  private

  def parse_slug
    LinkService::Parser.new(params[:slug]).exec
  end

  def increase_clicked(link)
    LinkService::Updater.new(link, clicked: link.clicked.to_i + 1).exec
  end
end