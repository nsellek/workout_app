class Client < User
  has_one :trainer_client
  has_one :trainer, through: :trainer_client

  has_many :workout_weeks
  has_many :workout_days, through: :workout_weeks
  has_many :exercises, through: :workout_days
end
