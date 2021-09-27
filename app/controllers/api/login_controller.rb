#
module Api
  class LoginController < ::Api::ApplicationController
    before_action :set_user

    def call
      validates_presence_of :email
      validates_presence_of :password

      unless @user
        render_error I18n.t('devise.failure.invalid', authentication_keys: :email)
        return
      end

      unless UserService::PasswordValidator.new(@user, params[:password]).valid?
        render_error I18n.t('devise.failure.invalid', authentication_keys: :email)
        return
      end

      render json: ApiSerializer::User.new(@user, root: :data, meta: { auth_token: generate_auth_token }), status: :ok
    end

    private

    def generate_auth_token
      UserService::AuthToken.issue(@user)
    end

    def set_user
      @user = User.find_by(email: params[:email].to_s.downcase)
    end
  end
end
