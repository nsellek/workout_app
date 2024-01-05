# frozen_string_literal: true

module Users
  class RegistrationsController < Devise::RegistrationsController
    skip_before_action :set_active_page,
      :check_account
    before_action :configure_sign_up_params, only: [:create]
    # before_action :configure_account_update_params, only: [:update]

    # GET /resource/sign_up
    def new
      if session[:trainer_id]
        trainer = Trainer.find(session[:trainer_id])
        @trainer = presenter(trainer)
      end
      super
    end

    # POST /resource
    def create
      super
      trainer = Trainer.find_by(id: session[:trainer_id])
      return unless trainer && resource.valid?

      session[:trainer_id] = nil

      client = resource.create_client
      client.trainer = trainer
      session[:account_id] = client.id
    end

    # GET /resource/edit
    # def edit
    #   super
    # end

    # PUT /resource
    # def update
    #   super
    # end

    # DELETE /resource
    # def destroy
    #   super
    # end

    # GET /resource/cancel
    # Forces the session data which is usually expired after sign
    # in to be expired now. This is useful if the user wants to
    # cancel oauth signing in/up in the middle of the process,
    # removing all OAuth session data.
    # def cancel
    #   super
    # end

    # protected

    # If you have extra params to permit, append them to the sanitizer.
    def configure_sign_up_params
      devise_parameter_sanitizer
        .permit(
          :sign_up,
          keys: [
            :first_name,
            :last_name,
            :type
          ]
        )
    end

    # If you have extra params to permit, append them to the sanitizer.
    # def configure_account_update_params
    #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
    # end

    # The path used after sign up.
    def after_sign_up_path_for(_resource)
      if session[:account_id]
        redirect_to(clients_workout_path)
      else
        accounts_path
      end
    end

    # The path used after sign up for inactive accounts.
    # def after_inactive_sign_up_path_for(resource)
    #   super(resource)
    # end
  end
end
