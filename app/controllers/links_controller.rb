#
class LinksController < ResourcesController
  protected

  def klass
    Link.active.where(created_by: current_user.id).order(created_at: :desc)
  end

  def permitted_params
    params.require(:resource).permit(:url, :created_by, :updated_by)
  end

  def set_default_filters
    super
    params[:q][:deleted_at_null] ||= '1'
  end
end