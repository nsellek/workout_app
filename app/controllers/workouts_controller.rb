class WorkoutsController < ApplicationController
  skip_before_action :set_active_page,
    :check_account

  def index
    @workouts = if params[:term]
                  term = params[:term].split.join('%').downcase
                  workouts = Workout.where('lower(name) LIKE ?', "%#{term}%")
                  workouts = workouts.where(muscle_group_id: params[:muscle_group_id]) if params[:muscle_group_id]
                  workouts
                else
                  Workout.none
                end
    render json: @workouts.for_dropdown
  end
end
