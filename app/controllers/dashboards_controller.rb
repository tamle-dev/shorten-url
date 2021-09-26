#
class DashboardsController < ApplicationController
  def index
    @total_users = User.count
    render 'dashboards/index'
  end
end
