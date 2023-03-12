class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :set_active_page

  helper_method :app_name

  def app_name
    # @app_name ||= @trainer.custom_name || "Workout App"
    'Workout App'
  end

  private

  def presenter(obj)
    if obj.is_a?(ActiveRecord::Associations::CollectionProxy) || obj.is_a?(ActiveRecord::AssociationRelation)
      item = obj.first
      return obj if item.nil?

      "#{item.class}Presenter".constantize.from_collection(obj)
    else
      "#{obj.class}Presenter".constantize.new(obj)
    end
  end
end
