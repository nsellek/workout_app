module Clients
  class HistoriesController < ApplicationController
    def index
      workout_days = current_account.workout_days.order(completed_at: :desc)

      start_date = params.fetch(:start_date, Date.today).to_date
      @workout_days = workout_days.where(completed_at: start_date.beginning_of_month.beginning_of_week..start_date.end_of_month.end_of_week)
    end

    def show
      @history = HistoryService.new(current_account, params[:id])
      @exercise_max = current_account.exercise_maxes.find_by(exercise_id: params[:id])
    end

    private

    def set_active_page
      @active_footer = 'history'
    end
  end
end
