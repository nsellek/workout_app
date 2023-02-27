module Clients
  class DashboardsController < ApplicationController

    def dashboard; end

    private

    def set_active_page
      @active_page = 'dashboard'
    end
  end
end
