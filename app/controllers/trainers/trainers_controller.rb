module Trainers
  class TrainersController < ApplicationController

    def profile
      @active_sidenav = 'trainer_profile'
    end

    private

    def set_active_page
      @active_page = 'profile'
    end
  end
end
