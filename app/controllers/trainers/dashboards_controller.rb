module Trainers
  class DashboardsController < ApplicationController
    add_breadcrumb 'Dashboard', :trainers_dashboard

    def dashboard; end

    private

    def set_active_page
      @active_page = 'dashboard'
    end
  end
end
