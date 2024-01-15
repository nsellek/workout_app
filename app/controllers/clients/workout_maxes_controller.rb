module Clients
  class WorkoutMaxesController < ApplicationController
    before_action :set_max, only: [:edit, :update]
    before_action :set_back_url, only: [:new, :edit]

    def index
      @back_url = clients_options_url
      @maxes = current_account.workout_maxes.includes(:workout)
    end

    def new
      @max = current_account.workout_maxes.new
      @exercises = Workout.for_dropdown
    end

    def create
      max = current_account.workout_maxes.new(max_params)

      if max.save
        flash[:notice] = 'Successfully added new max!'
        redirect_to clients_workout_maxes_path
      else
        render action: :new
      end
    end

    def edit; end

    def update
      if @max.update(max_params)
        flash[:notice] = 'Successfully updated max!'
        redirect_to clients_workout_maxes_path
      end
    end

    private

    def set_active_page
      @active_footer = 'options'
    end

    def set_back_url
      @back_url = clients_workout_maxes_path
    end

    def set_max
      @max = current_account.workout_maxes.find(params[:id])
    end

    def max_params
      params
        .require(:workout_max)
        .permit(
          :workout_id,
          :amount
        )
    end
  end
end
