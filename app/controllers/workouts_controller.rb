class WorkoutsController < ApplicationController
  skip_before_action :set_active_page,
    :check_account,
    :check_for_trainer

  def index
    @workouts = if params[:term]
                  term = params[:term].split.join('%').downcase
                  Workout.where('lower(name) LIKE ?', "%#{term}%")
                else
                  Workout.none
                end
    render json: @workouts.for_dropdown
  end
end
