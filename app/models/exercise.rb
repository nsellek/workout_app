class Exercise < ApplicationRecord
  belongs_to :workout_day

  has_one :client, through: :workout_day
  has_one :workout_set
end
