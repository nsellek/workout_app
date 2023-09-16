class MuscleGroup < ApplicationRecord
  has_many :workouts

  def self.hashed_all
    @hashed_all ||= all.each_with_object({}) do |group, hsh|
      hsh[group.name.downcase] = group
    end
  end

  def self.for_dropdown
    @for_dropdown ||= all.map { |workout| [workout.name, workout.id] }
  end
end
