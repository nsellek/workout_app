class Workout < ApplicationRecord
  belongs_to :muscle_group

  def self.for_dropdown
    all.map { |workout| { label: workout.name, value: workout.id } }
  end
end
