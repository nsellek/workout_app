# frozen_string_literal: true

module Users
  class SessionsController < Devise::SessionsController
    skip_before_action :set_active_page,
      :check_account
    # before_action :configure_sign_in_params, only: [:create]

    # GET /resource/sign_in
    # def new
    #   super
    # end

    # POST /resource/sign_in
    # def create
    #   super
    # end

    # DELETE /resource/sign_out
    def destroy
      session[:account_id] = nil
      super
    end

    # protected

    # If you have extra params to permit, append them to the sanitizer.
    # def configure_sign_in_params
    #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
    # end

    def after_sign_in_path_for(_resource)
      accounts_path
    end
  end
end
