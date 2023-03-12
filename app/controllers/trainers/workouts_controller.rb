module Trainers
  class WorkoutsController < ApplicationController
    before_action :set_client

    add_breadcrumb 'Clients', :trainers_clients

    def index
      add_breadcrumb 'Workouts'
      @workout_weeks = presenter(@client.workout_weeks.includes(workout_days: [:exercises]).reverse_order)
      @week_count = @workout_weeks.count
    end

    def new
      add_breadcrumb 'Wrokouts', trainers_client_workouts_path(@client)
      add_breadcrumb 'New'
      @workout_week = current_user.workout_weeks.new(client_id: @client.id)
      workout_day = @workout_week.workout_days.build
      workout_day.exercises.build
    end

    private

    def set_active_page
      @active_page = 'clients'
      @active_sidenav = 'client_workouts'
    end

    def set_client
      @client = presenter(current_user.clients.find(params[:client_id]))
    end
  end
end
