module Clients
  class ClientsController < ApplicationController

    def edit
      @back_url = clients_options_url
    end

    def update
      current_user.update(user_params)

      flash[:notice] = 'Updated Profile!'
      redirect_to clients_options_url
    end

    private

    def set_active_page
      @active_footer = 'options'
    end

    def user_params
      params
        .require(:client)
        .permit(
          :first_name,
          :last_name,
          :email
        )
    end
  end
end
