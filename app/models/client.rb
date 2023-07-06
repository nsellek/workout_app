class Client < User
  has_one :trainer_client
  has_one :trainer, through: :trainer_client

  has_many :workout_weeks
  has_many :workout_days, through: :workout_weeks
  has_many :exercises, through: :workout_days
  has_many :workout_sets, through: :exercises

  def current_workout_day
    workout_days.includes(exercises: :workout_sets).where(completed_at: [Date.today, nil]).first
  end
end
