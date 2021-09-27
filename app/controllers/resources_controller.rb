class ResourcesController < AuthController
  helper_method :klass,
                :klass_name,
                :klass_plural_name,
                :klass_constantize,
                :collection_path,
                :new_resource_path,
                :edit_resource_path,
                :resource_path

  before_action :set_resource, only: [:show, :edit, :update, :destroy]
  before_action :set_act_by, only: [:update, :create, :destroy]
  before_action :set_default_filters, only: :index

  def index
    @q = (index_collection || klass).ransack(params[:q])
    @collection = @q.result(distinct: true).order(id: :asc)
    respond_with @collection
  end

  def show
  end

  def create
    @resource = (form_klass || klass).new(permitted_params)
    if @resource.valid?
      @resource = creator_klass.new(permitted_params).exec
      flash[:notice] = I18n.t('flash.actions.create.notice', resource_name: @resource.model_name.human)
      respond_to do |format|
        format.html { redirect_to resource_path }
      end
    else
      flash[:alert] = I18n.t('flash.actions.create.alert', resource_name: @resource.model_name.human)
      respond_to do |format|
        format.html { render :new }
        format.js { render :new }
        format.json { render json: Oj.dump({ message: @resource.errors.full_messages.join(', '), error_code: 'InvalidParam', errors: @resource.errors }, mode: :compat), status: 400 }
      end
    end
  end

  def new
    @resource = (form_klass || klass).new
  end

  def edit
  end

  def update
    @resource.assign_attributes(permitted_params)
    if @resource.valid?
      updater_klass.new(klass.find(params[:id]), permitted_params).exec
      flash[:notice] = I18n.t('flash.actions.update.notice', resource_name: @resource.model_name.human)
      respond_to do |format|
        format.html { redirect_to resource_path }
        format.js { js_redirect_to resource_path }
      end
    else
      flash[:alert] = I18n.t('flash.actions.update.alert', resource_name: @resource.model_name.human)
      render :edit
    end
  end

  def destroy
    destroyer_klass.new(@resource).exec
    flash[:alert] = I18n.t('flash.actions.destroy.notice', resource_name: @resource.model_name.human)
    respond_to do |format|
      format.html { redirect_to collection_path }
      format.js { js_redirect_to collection_path }
    end
  end

  protected

  def klass
    raise NotImplementedError
  end

  def permitted_params
    raise NotImplementedError
  end

  def set_default_filters
    params[:q] ||= {}
  end

  def index_collection
    nil
  end

  def form_klass
    "#{klass_constantize}Form".constantize
  end

  def creator_klass
    "#{klass_constantize}Service::Creator".constantize
  end

  def updater_klass
    "#{klass_constantize}Service::Updater".constantize
  end

  def destroyer_klass
    "#{klass_constantize}Service::Destroyer".constantize
  end

  def collection_path
    send("#{klass_plural_name}_path")
  end

  def resource_path
    send("#{klass_name}_path", @resource)
  end

  def new_resource_path
    send("new_#{klass_name}_path")
  end

  def edit_resource_path
    send("edit_#{klass_name}_path", @resource)
  end

  def klass_name
    @klass_name ||= klass.name.underscore
  end

  def klass_plural_name
    @klass_plural_name ||= klass.name.pluralize.underscore
  end

  def set_resource
    @resource = (form_klass || klass).find(params[:id])
  end

  def klass_constantize
    @klass_constantize ||= klass.name.constantize
  end

  def set_act_by
    params[:resource] ||= {}
    params[:resource][:updated_by] = current_user.id if action_name == 'update'
    params[:resource][:created_by] = current_user.id if action_name == 'create'
  end
end
