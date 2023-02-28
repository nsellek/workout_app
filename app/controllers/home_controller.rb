class HomeController < ApplicationController
  skip_before_action  :authenticate_user!,
                      :set_active_page

  def index
    redirect_to new_user_session_path
  end
end
