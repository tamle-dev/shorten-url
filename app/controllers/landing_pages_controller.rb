#
class LandingPagesController < ApplicationController
  def index
    render 'landing_pages/index', layout: false
  end

  def access
    link = parse_slug

    unless link
      return redirect_to root_path
    end

    increase_clicked(link)

    redirect_to link.url
  end

  private

  def parse_slug
    LinkService::Parser.new(params[:slug]).exec
  end

  def increase_clicked(link)
    LinkService::Updater.new(link, clicked: link.clicked.to_i + 1).exec
  end
end
