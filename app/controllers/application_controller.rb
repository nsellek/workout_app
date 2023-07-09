class ApplicationController < ActionController::Base
  before_action :authenticate_user!,
    :check_account,
    :set_active_page
  before_action :check_for_trainer, if: -> { current_account&.client? }

  helper_method :app_name,
    :current_account

  def app_name
    # @app_name ||= @trainer.custom_name || "Workout App"
    'Workout App'
  end

  private

  def check_account
    return if current_account

    redirect_to accounts_path
  end

  def check_for_trainer
    return if current_account.trainer

    redirect_to new_clients_trainer_path
  end

  def presenter(obj)
    return nil if obj.nil?

    if obj.is_a?(ActiveRecord::Associations::CollectionProxy) || obj.is_a?(ActiveRecord::AssociationRelation)
      item = obj.first
      return obj if item.nil?

      "#{item.class}Presenter".constantize.from_collection(obj)
    else
      "#{obj.class}Presenter".constantize.new(obj)
    end
  end

  def current_account
    return @current_account if defined? @current_account
    return nil unless session[:account_id]

    account = Account.find(session[:account_id])
    @current_account = presenter(account)
  end

  def current_user
    return @current_user if defined? @current_user
    return nil unless super

    @current_user = presenter(super)
  end
end
