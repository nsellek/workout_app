class ClientWorkout < ApplicationRecord
  has_many :workouts

  belongs_to :trainer
  belongs_to :client
end
