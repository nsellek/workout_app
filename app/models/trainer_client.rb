class TrainerClient < ApplicationRecord
  belongs_to :trainer
  belongs_to :client

  scope :active, -> { where(active: true) }
  scope :not_active, -> { where.not(active: true) }
end
