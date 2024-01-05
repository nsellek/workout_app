class InvitesController < ApplicationController
  skip_before_action :authenticate_user!,
    :set_active_page,
    :check_account

  def show
    invite = InviteToken.where(token: params[:token]).first
    unless invite
      flash[:notice] = 'Invalid invite token'
      redirect_to new_user_registration_path and return
    end

    if current_user
      client = current_user.client || current_user.create_client
      client.trainer = invite.trainer

      redirect_to clients_workout_path
    else
      session[:trainer_id] = invite.trainer_id
      redirect_to new_user_registration_path
    end
  end
end
