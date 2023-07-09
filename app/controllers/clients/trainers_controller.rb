module Clients
  class TrainersController < ApplicationController
    skip_before_action :set_active_page,
      :check_for_trainer

    def new; end

    def create
      invite = InviteToken.find_by(token: params[:invite][:token])
      current_account.trainer = invite.trainer
      current_account.save
      flash[:notice] = 'Accepted invite'
      redirect_to clients_workout_path
    end
  end
end
