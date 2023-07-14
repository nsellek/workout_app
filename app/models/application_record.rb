class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class

  default_scope { order(id: :asc) }
end
