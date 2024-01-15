class WorkoutSet < ApplicationRecord
  belongs_to :exercise

  has_one :workout, through: :exercise
  has_one :client, through: :exercise

  before_save :check_max

  private

  def check_max
    current_max = WorkoutMax.find_or_initialize_by(client_id: client.id, workout_id: workout.id)

    if reps > 1
      projected_max = MaxService.project_max(weight, reps)
      current_max.projected_max = projected_max if current_max.projected_max.to_i < projected_max
    elsif current_max.amount.to_i < weight
      current_max.amount = weight
    end

    current_max.set_history
    current_max.save!
  end
end
