module Trainers
  class ClientsController < ApplicationController

    def index
      @clients = current_user.clients
    end

    private

    def set_active_page
      @active_page = 'clients'
    end
  end
end
