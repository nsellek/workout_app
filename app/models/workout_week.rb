class WorkoutWeek < ApplicationRecord
  has_many :workout_days
  has_many :exercises, through: :workout_days

  belongs_to :trainer
  belongs_to :client

  accepts_nested_attributes_for :workout_days, allow_destroy: true

  scope :active, -> { where(deleted: false) }

  def self.display_includes
    includes(workout_days: [exercises: [:workout_sets, :muscle_group, :workout]])
  end
end
