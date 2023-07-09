module Clients
  class WorkoutDaysController < ApplicationController
    before_action :set_workout_day, only: :complete

    def index
      @workout_day = presenter(current_account.current_workout_day)
    end

    def complete
      @workout_day.complete!

      flash[:notice] = 'Workout Completed!'
      respond_to(&:turbo_stream)
    end

    private

    def set_active_page
      @active_footer = 'workouts'
    end

    def set_workout_day
      @workout_day = presenter(current_account.workout_days.includes(exercises: :workout_sets).find(params[:id]))
    end
  end
end
