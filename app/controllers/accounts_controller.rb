class AccountsController < ApplicationController
  skip_before_action :set_active_page,
    :check_account,
    :check_for_trainer

  def index
    session[:account_id] = nil
  end

  def create
    account = Account.create(user_id: current_user.id, type: params[:type])
    session[:account_id] = account.id

    if account.client?
      redirect_to clients_dashboard_path
    else
      redirect_to trainers_dashboard_path
    end
  end

  def show
    account = Account.find_by(id: params[:id], user_id: current_user.id)
    session[:account_id] = account.id

    if account.client?
      redirect_to clients_dashboard_path
    else
      redirect_to trainers_dashboard_path
    end
  end
end
