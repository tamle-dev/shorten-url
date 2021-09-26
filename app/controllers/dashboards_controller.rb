#
class DashboardsController < AuthController
  def index
    @total_users = total_users_count
    @total_links = total_links_count
    @top_clicked = top_clicked

    render 'dashboards/index'
  end

  private

  def total_users_count
    User.count
  end

  def total_links_count
    Link.count
  end

  def top_clicked
    Link.top_clicked(current_user.id)
  end
end
