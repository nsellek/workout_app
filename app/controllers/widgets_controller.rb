class WidgetsController < ApplicationController
  skip_before_action :set_active_page

  def index
    @widget = Widget.find_by(file_name: params[:widget])
  end
end
