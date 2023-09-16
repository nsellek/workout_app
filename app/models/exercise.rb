class Exercise < ApplicationRecord
  belongs_to :workout_day
  belongs_to :workout
  belongs_to :muscle_group

  has_one :client, through: :workout_day

  has_many :workout_sets

  def name
    workout&.name || super
  end
end
