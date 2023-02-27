class InvitesController < ApplicationController
  skip_before_action  :authenticate_user!,
                      :set_active_page

  def show
    invite = InviteToken.where(token: params[:token]).first
    if invite
      redirect_to new_user_registration_path(trainer_id: invite.trainer_id)
    else
      alert = 'Invalid invite token'
      redirect_to new_user_registration_path
    end
  end
end
