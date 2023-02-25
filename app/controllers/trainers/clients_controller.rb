module Trainers
  class ClientsController < ApplicationController
    add_breadcrumb 'Clients', :trainers_clients

    def index
      @clients = ::ClientPresenter.from_collection(current_user.clients)
    end

    def new
      add_breadcrumb 'Invite Client', :new_trainers_client
      @invite_url = "#{request.host_with_port}/users/sign_up/#{current_user.token}"
    end

    private

    def set_active_page
      @active_page = 'clients'
    end
  end
end
