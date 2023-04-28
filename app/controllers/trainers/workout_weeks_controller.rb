module Trainers
  class WorkoutWeeksController < ApplicationController
    before_action :set_client

    skip_before_action :set_active_page

    def create
      @workout_week = current_user.workout_weeks.new(workout_week_params)

      if @workout_week.save
        flash[:notice] = 'Week successfully created!'
        redirect_to trainers_client_workouts_path(@client)
      else
        render action: :new, controller: :workouts
      end
    end

    def update
      @workout_week = current_user.workout_weeks.find(params[:id])

      if @workout_week.update(workout_week_params)
        flash[:notice] = 'Week successfully updated!'
        redirect_to trainers_client_workouts_path(@client)
      else
        render action: :edit, controller: :workouts
      end
    end

    private

    def set_client
      @client = current_user.clients.find(params[:client_id])
    end

    def workout_week_params
      params
        .require(:workout_week)
        .permit(
          :name,
          workout_days_attributes: [
            :id,
            :_destroy,
            exercises_attributes: [
              :id,
              :name,
              :sets,
              :reps,
              :weight,
              :_destroy
            ]
          ]
        ).merge(client_id: @client.id)
    end
  end
end
