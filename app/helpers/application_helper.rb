module ApplicationHelper

  def active_nav_item(page)
    'active' if @active_page == page
  end
end
