class WorkoutDay < ApplicationRecord
  belongs_to :workout_week

  has_one :client, through: :workout_week

  has_many :exercises

  scope :completed, -> { where(completed: true) }
  scope :incompleted, -> { where(completed: false) }

  accepts_nested_attributes_for :exercises, allow_destroy: true

end
