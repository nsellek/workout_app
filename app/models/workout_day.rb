class WorkoutDay < ApplicationRecord
  belongs_to :workout_week

  has_one :client, through: :workout_week

  has_many :exercises

  accepts_nested_attributes_for :exercises
end
