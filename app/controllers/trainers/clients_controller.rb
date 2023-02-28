module Trainers
  class ClientsController < ApplicationController
    add_breadcrumb 'Clients', :trainers_clients

    def index
      @clients = presenter(current_user.clients)
    end

    def show
      @client = presenter(Client.find(params[:id]))
      add_breadcrumb @client.fullname
      @active_sidenav = 'client_profile'
    end

    def new
      add_breadcrumb 'Invite Client', :new_trainers_client
      @invite_url = "#{request.host_with_port}/invite/#{current_user.token}"
    end

    private

    def set_active_page
      @active_page = 'clients'
    end
  end
end
