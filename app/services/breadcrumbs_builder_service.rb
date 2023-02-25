class BreadcrumbsBuilderService < BreadcrumbsOnRails::Breadcrumbs::Builder
  def render
    @context.render '/layouts/breadcrumbs', breadcrumbs: @elements
  end
end
