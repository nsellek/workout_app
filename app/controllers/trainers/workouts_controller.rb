module Trainers
  class WorkoutsController < ApplicationController
    before_action :set_client
    before_action :set_workout, only: [:edit, :show, :destroy]

    add_breadcrumb 'Clients', :trainers_clients

    def index
      add_breadcrumb 'Workouts'
      @workout_weeks = presenter(
        @client
          .workout_weeks
          .active
          .includes(workout_days: [:exercises])
          .reverse_order
      )
      @week_count = @workout_weeks.count
    end

    def new
      add_breadcrumb 'Wrokouts', trainers_client_workouts_path(@client)
      add_breadcrumb 'New'
      @workout_week = presenter(current_account.workout_weeks.new(client_id: @client.id))
      @week_count = current_account.workout_weeks.active.count
      @muscle_groups = MuscleGroup.for_dropdown
      workout_day = @workout_week.workout_days.build
      workout_day.exercises.build
    end

    def edit
      add_breadcrumb 'Wrokouts', trainers_client_workouts_path(@client)
      add_breadcrumb "Edit #{@workout_week.name}"
      @muscle_groups = MuscleGroup.for_dropdown
    end

    def destroy
      @workout_week.update(deleted: true)

      redirect_to trainers_client_workouts_path(@client)
    end

    private

    def set_active_page
      @active_page = 'clients'
      @active_sidenav = 'client_workouts'
    end

    def set_client
      @client = presenter(current_account.clients.find(params[:client_id]))
    end

    def set_workout
      @workout_week = presenter(
        WorkoutWeek.where(
          trainer: current_account,
          client: @client
        ).includes(workout_days: [:exercises]).find(params[:id])
      )
    end
  end
end
