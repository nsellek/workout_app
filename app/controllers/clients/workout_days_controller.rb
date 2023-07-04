module Clients
  class WorkoutDaysController < ApplicationController

    def index
      @workout_day = presenter(current_user.workout_days.includes(:exercises).incompleted.first)
    end

    private

    def set_active_page
      @active_footer = 'workouts'
    end
  end
end
