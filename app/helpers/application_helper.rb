module ApplicationHelper
  def active_nav_item(page)
    return 'active' if @active_page == page
    return 'active' if @active_sidenav == page
  end

  def breadcrumbs
    render_breadcrumbs separator: '', builder: BreadcrumbsBuilderService
  end
end
