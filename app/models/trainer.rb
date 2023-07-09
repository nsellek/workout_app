class Trainer < Account
  has_many :trainer_clients, dependent: :destroy
  has_many :clients, through: :trainer_clients
  has_many :workout_weeks
  has_many :workout_days, through: :workout_weeks

  has_one :invite_token

  def token
    (invite_token || create_invite_token).token
  end
end
