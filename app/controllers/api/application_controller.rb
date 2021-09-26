#
module Api
  class ApplicationController < ::ActionController::API
    include ApiErrorHandler
    include ApiParamValidation
    include ApiResponser
  
    def version
      render json: {
        version: APP_VERSION,
      }, status: 200
    end

    private

    def paging(collection)
      collection.page(params[:page]).per(per_page)
    end
  
    def per_page
      params[:per_page] || 10
    end
  end
end
