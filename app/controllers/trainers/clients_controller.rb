module Trainers
  class ClientsController < ApplicationController
    before_action :set_client, only: [:show, :dashboard]

    add_breadcrumb 'Clients', :trainers_clients

    def index
      @clients = presenter(current_account.clients)
    end

    def show
      add_breadcrumb @client.fullname
      @active_sidenav = 'client_profile'
    end

    def new
      add_breadcrumb 'Invite Client', :new_trainers_client
      @invite_url = "#{request.host_with_port}/invite/#{current_account.token}"
    end

    def dashboard
      add_breadcrumb @client.fullname
      add_breadcrumb 'Dashboard'
      @active_sidenav = 'client_dashboard'

      @widgets = Widget.all
      @trainer_widgets = current_account.trainer_widgets.includes(:widget)
      @active_widget_ids = current_account.widget_ids
    end

    private

    def set_active_page
      @active_page = 'clients'
    end

    def set_client
      @client = presenter(current_account.clients.find(params[:id] || params[:client_id]))
    end
  end
end
