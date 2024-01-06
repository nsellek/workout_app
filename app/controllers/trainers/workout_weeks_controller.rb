module Trainers
  class WorkoutWeeksController < ApplicationController
    before_action :set_client
    before_action :set_workout_week, only: [:edit, :show, :destroy]

    add_breadcrumb 'Clients', :trainers_clients

    def index
      add_breadcrumb 'Workout Weeks'
      @workout_weeks = presenter(
        @client
          .workout_weeks
          .active
          .includes(workout_days: [:exercises])
          .where(trainer_id: current_account.id)
          .reverse_order
      )
      @week_count = @workout_weeks.count
    end

    def new
      add_breadcrumb 'Wrokout Weeks', trainers_client_workout_weeks_path(@client)
      add_breadcrumb 'New'
      @workout_week = presenter(current_account.workout_weeks.new(client_id: @client.id))
      @week_count = current_account.workout_weeks.active.count
      @muscle_groups = MuscleGroup.for_dropdown
      workout_day = @workout_week.workout_days.build
      workout_day.exercises.build
    end

    def create
      @workout_week = current_account.workout_weeks.new(workout_week_params)

      if @workout_week.save
        flash[:notice] = 'Week successfully created!'
        redirect_to trainers_client_workout_weeks_path(@client)
      else
        render action: :new
      end
    end

    def edit
      add_breadcrumb 'Wrokout Weeks', trainers_client_workout_weeks_path(@client)
      add_breadcrumb "Edit #{@workout_week.name}"
      @muscle_groups = MuscleGroup.for_dropdown
    end

    def update
      @workout_week = presenter(current_account.workout_weeks.find(params[:id]))

      if @workout_week.update(workout_week_params)
        flash[:notice] = 'Week successfully updated!'
        redirect_to trainers_client_workout_weeks_path(@client)
      else
        @muscle_groups = MuscleGroup.for_dropdown
        flash[:notice] = @workout_week.errors.full_messages
        render action: :edit
      end
    end

    def show
      add_breadcrumb 'Workouts', trainers_client_workout_weeks_path(@client)
      add_breadcrumb @workout_week.name
    end

    def destroy
      @workout_week.update(deleted: true)

      redirect_to trainers_client_workout_weeks_path(@client)
    end

    private

    def set_client
      @client = presenter(current_account.clients.find(params[:client_id]))
    end

    def set_workout_week
      @workout_week = presenter(
        WorkoutWeek
          .display_includes
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
              :workout_id,
              :sets,
              :reps,
              :weight,
              :notes,
              :client_choice,
              :muscle_group_id,
              :_destroy
            ]
          ]
        ).merge(client_id: @client.id)
    end

    def set_active_page
      @active_page = 'clients'
      @active_sidenav = 'client_workout_weeks'
    end
  end
end
