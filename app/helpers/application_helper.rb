module ApplicationHelper
  def active_nav_item(page)
    return 'active' if @active_page == page
    return 'active' if @active_sidenav == page
    return 'active' if @active_footer == page
  end

  def breadcrumbs
    render_breadcrumbs separator: '', builder: BreadcrumbsBuilderService unless browser.mobile?
  end

  def add_img
    'https://ui-avatars.com/api?name=%2B&rounded=true&format=svg'
  end

  def lazy_img_tag(source, options = {})
    options[:class] = "#{options[:class]} lazyload"
    options[:data] ||= {}
    options[:data][:src] = source

    image_tag '', options
  end
end
