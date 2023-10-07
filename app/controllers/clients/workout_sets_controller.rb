module Clients
  class WorkoutSetsController < ApplicationController
    before_action :set_exercise, only: [:new, :create]
    before_action :set_set, except: [:new, :create]

    skip_before_action :set_active_page

    def new
      @workout_set = @exercise.workout_sets.build
    end

    def create
      @workout_set = @exercise.workout_sets.create(set_params)

      respond_to(&:turbo_stream)
    end

    def edit; end

    def update
      @set.update(set_params)

      respond_to(&:turbo_stream)
    end

    def destroy
      @set.delete

      respond_to do |format|
        format.turbo_stream { render turbo_stream: turbo_stream.remove("exercise-#{@set.exercise_id}-set-#{@set.id}") }
      end
    end

    def repeat
      @new_set = @set.dup
      @new_set.save

      respond_to(&:turbo_stream)
    end

    private

    def set_exercise
      @exercise = presenter(current_account.exercises.find(params[:exercise_id]))
    end

    def set_set
      @set = current_account.workout_sets.find(params[:id])
    end

    def set_params
      params
        .require(:workout_set)
        .permit(
          :weight,
          :reps,
          :warmup
        )
    end
  end
end
