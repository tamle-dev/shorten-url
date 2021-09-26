module ApplicationHelper
  def active_menu(options = {})
    ActiveMenuService.new(controller, options).exec
  end

  def build_version
    APP_VERSION
  end
end
