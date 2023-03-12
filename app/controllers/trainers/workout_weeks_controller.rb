module Trainers
  class WorkoutWeeksController < ApplicationController
    before_action :set_client

    skip_before_action :set_active_page

    def create
      @workout_week = current_user.workout_weeks.new(workout_week_params)
      @workout_week.client = @client
binding.pry
      if @workout_week.save
        redirect_to trainers_client_workouts_path(@client)
      else
        render :new
      end
    end

    private

    def set_client
      @client = current_user.clients.find(params[:client_id])
    end

    def add_exercise?
      params[:commit] == 'Add exercise'
    end

    def add_day?
      params[:commit] == 'Add Day'
    end

    def workout_week_params
      params
        .require(:workout_week)
        .permit(
          :name,
          workout_days_attributes: [
            exercises_attributes: [
              :name,
              :sets,
              :reps,
              :weight
            ]
          ]
        )
    end
  end
end
