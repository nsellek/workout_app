module Trainers
  class ConfigurationsController < ApplicationController

    def index
      @configs = current_account.configuration || current_account.create_configuration
    end

    def update
      configs = current_account.configuration
      configs.settings = setting_params
      configs.save

      redirect_back(fallback_location: trainers_configurations_path)
    end

    private

    def set_active_page
      @active_page = 'profile'
      @active_sidenav = 'configs'
    end

    def setting_params
      params
        .require(:configuration)
        .permit(
          *ConfigHandler::CONFIG_FIELDS
        )
    end
  end
end
