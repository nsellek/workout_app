class ApplicationController < ActionController::Base
  include Pagy::Backend

  before_action :authenticate_user!,
    :check_account,
    :set_active_page

  helper_method :app_name,
    :current_account,
    :settings

  def app_name
    @app_name ||= settings.app_name
  end

  def settings
    @settings ||= current_account.settings
  end

  private

  def check_account
    return if current_account

    redirect_to accounts_path
  end

  def presenter(obj)
    return nil if obj.nil?

    if obj.respond_to?(:length)
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
