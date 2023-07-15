module Trainers
  class WorkoutWeeksController < ApplicationController
    before_action :set_client
    before_action :set_workout_week, only: [:show]

    add_breadcrumb 'Clients', :trainers_clients

    def create
      @workout_week = current_account.workout_weeks.new(workout_week_params)

      if @workout_week.save
        flash[:notice] = 'Week successfully created!'
        redirect_to trainers_client_workouts_path(@client)
      else
        render action: :new, controller: :workouts
      end
    end

    def update
      @workout_week = current_account.workout_weeks.find(params[:id])

      if @workout_week.update(workout_week_params)
        flash[:notice] = 'Week successfully updated!'
        redirect_to trainers_client_workouts_path(@client)
      else
        render action: :edit, controller: :workouts
      end
    end

    def show
      add_breadcrumb 'Workouts', trainers_client_workouts_path(@client)
      add_breadcrumb @workout_week.name
    end

    private

    def set_client
      @client = presenter(current_account.clients.find(params[:client_id]))
    end

    def set_workout_week
      @workout_week = presenter(
        WorkoutWeek
          .includes(workout_days: [exercises: :workout_sets])
          .find_by(
            trainer_id: current_account.id,
            client_id: @client.id,
            id: params[:id]
          )
      )
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
              :notes,
              :_destroy
            ]
          ]
        ).merge(client_id: @client.id)
    end

    def set_active_page
      @active_page = 'clients'
      @active_sidenav = 'client_workouts'
    end
  end
end
