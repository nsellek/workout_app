module Clients
  class TrainersController < ApplicationController
    skip_before_action :set_active_page,
      only: [:new, :create]

    def index
      @back_url = clients_options_url
      @current_trainer = presenter(current_account.trainer)
      @past_trainers = presenter(current_account.past_trainers)
    end

    def new; end

    def create
      invite = InviteToken.find_by(token: params[:invite][:token])
      current_account.trainer = invite.trainer
      current_account.save
      flash[:notice] = 'Accepted invite'
      redirect_to clients_workout_path
    end

    def destroy
      trainer_link = current_account.trainer_clients.active.first
      trainer_link.update(active: false)
      flash[:notice] = 'Successfully removed trainer'

      redirect_back(fallback_location: clients_options_url)
    end

    private

    def set_active_page
      @active_footer = 'options'
    end
  end
end
