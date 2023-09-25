class Exercise < ApplicationRecord
  belongs_to :workout_day
  belongs_to :workout, optional: true
  belongs_to :muscle_group, optional: true

  has_one :client, through: :workout_day

  has_many :workout_sets
end
