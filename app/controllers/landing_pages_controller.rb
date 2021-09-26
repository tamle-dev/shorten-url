#
class LandingPagesController < ApplicationController
  def index
    render 'landing_pages/index', layout: false
  end
end
