module Clients
  class WorkoutSetsController < ApplicationController
    before_action :set_exercise, except: [:edit, :update, :delete]
    before_action :set_set, only: [:edit, :update, :delete]

    skip_before_action :set_active_page

    def new
      @workout_set = @exercise.workout_sets.build
    end

    def create
      @workout_set = @exercise.workout_sets.create(set_params)

      respond_to(&:turbo_stream)
    end

    def edit; end

    def update
      @set.update(set_params)

      respond_to(&:turbo_stream)
    end

    private

    def set_exercise
      @exercise = current_user.exercises.find(params[:exercise_id])
    end

    def set_set
      @set = current_user.workout_sets.find(params[:id])
    end

    def set_params
      params
        .require(:workout_set)
        .permit(:weight, :reps)
    end
  end
end
