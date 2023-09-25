module Trainers
  class WorkoutsController < ApplicationController
    before_action :set_active_page
    before_action :set_workout, only: [:edit, :update]

    add_breadcrumb 'Custom Workouts', :trainers_workouts

    def index
      @pagy, @workouts = pagy(current_account.workouts)
    end

    def new
      add_breadcrumb 'New'
      @workout = current_account.workouts.build
      @muscle_groups = MuscleGroup.for_dropdown
    end

    def create
      @workout = current_account.workouts.new(workout_params)

      if @workout.save
        flash[:notice] = 'Custom Workout added!'
        redirect_to trainers_workouts_path
      else
        render :new
      end
    end

    def edit
      add_breadcrumb 'Edit'
      @muscle_groups = MuscleGroup.for_dropdown
    end

    def update
      if @workout.update(workout_params)
        flash[:notice] = 'Custom Workout Updated!'
        redirect_to trainers_workouts_path
      else
        render :edit
      end
    end

    private

    def set_active_page
      @active_page = 'profile'
      @active_sidenav = 'workouts'
    end

    def set_workout
      @workout = current_account.workouts.find(params[:id])
    end

    def workout_params
      params
        .require(:workout)
        .permit(
          :name,
          :muscle_group_id
        )
    end
  end
end
