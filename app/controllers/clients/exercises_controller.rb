module Clients
  class ExercisesController < ApplicationController
    before_action :set_exercise

    skip_before_action :set_active_page

    def edit; end

    def update
      @exercise.update(exercise_params)
      @exercise = presenter(@exercise)

      respond_to(&:turbo_stream)
    end

    private

    def set_exercise
      @exercise = current_account.exercises.find(params[:id])
    end

    def exercise_params
      params.require(:exercise).permit(:workout_id)
    end
  end
end
