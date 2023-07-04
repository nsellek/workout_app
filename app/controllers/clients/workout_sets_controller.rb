module Clients
  class WorkoutSetsController < ApplicationController
    before_action :set_exercise

    skip_before_action :set_active_page

    def new
      @workout_set = @exercise.workout_sets.build
    end

    def create
      @workout_set = @exercise.workout_sets.create(set_params)

      respond_to do |format|
        format.turbo_stream
      end
    end

    private

    def set_exercise
      @exercise = current_user.exercises.find(params[:exercise_id])
    end

    def set_params
      params
        .require(:workout_set)
        .permit(:weight, :reps)
    end
  end
end
