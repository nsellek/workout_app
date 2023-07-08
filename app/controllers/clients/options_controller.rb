module Clients
  class OptionsController < ApplicationController
    def index; end

    private

    def set_active_page
      @active_footer = 'options'
    end
  end
end
