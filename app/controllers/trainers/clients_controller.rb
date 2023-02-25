module Trainers
  class ClientsController < ApplicationController

    def index
      @clients = ::ClientPresenter.from_collection(current_user.clients)
    end

    def new
      @invite_url = "#{request.host_with_port}/users/sign_up/#{current_user.token}"
    end

    private

    def set_active_page
      @active_page = 'clients'
    end
  end
end
