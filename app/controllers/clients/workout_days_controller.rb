module Clients
  class WorkoutDaysController < ApplicationController
    before_action :check_for_trainer, except: [:show], unless: -> { params[:day_id].present? }
    before_action :set_workout_day, only: :complete

    def index
      @workout_day = if params[:day_id]
                       presenter(current_account.workout_days.find(params[:day_id]))
                     else
                       presenter(current_account.current_workout_day)
                     end
      @workout_week = @workout_day&.workout_week
      @view_only = @workout_day&.id != current_account.current_workout_day&.id
    end

    def show
      @workout_day = presenter(current_account.workout_days.find(params[:id]))
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

    def check_for_trainer
      return if current_account.trainer

      redirect_to new_clients_trainer_path
    end
  end
end
