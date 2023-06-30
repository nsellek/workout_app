module Trainers
  class WorkoutsController < ApplicationController
    before_action :set_client
    before_action :set_workout, only: [:edit, :show]

    add_breadcrumb 'Clients', :trainers_clients

    def index
      add_breadcrumb 'Workouts'
      @workout_weeks = presenter(@client.workout_weeks.includes(workout_days: [:exercises]).reverse_order)
      @week_count = @workout_weeks.count
    end

    def new
      add_breadcrumb 'Wrokouts', trainers_client_workouts_path(@client)
      add_breadcrumb 'New'
      @workout_week = presenter(current_user.workout_weeks.new(client_id: @client.id))
      @week_count = current_user.workout_weeks.count
      workout_day = @workout_week.workout_days.build
      workout_day.exercises.build
    end

    def edit
      add_breadcrumb 'Wrokouts', trainers_client_workouts_path(@client)
      add_breadcrumb "Edit #{@workout_week.name}"
    end

    private

    def set_active_page
      @active_page = 'clients'
      @active_sidenav = 'client_workouts'
    end

    def set_client
      @client = presenter(current_user.clients.find(params[:client_id]))
    end

    def set_workout
      @workout_week = presenter(
        WorkoutWeek.where(
          trainer: current_user,
          client: @client
        ).includes(workout_days: [:exercises]).find(params[:id])
      )
    end
  end
end
