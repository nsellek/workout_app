class Trainer < User
  has_many :trainer_clients
  has_many :clients, through: :trainer_clients
  has_many :client_workouts
  has_many :workouts, through: :client_workouts

  has_one :invite_token

  def token
    (invite_token || create_invite_token).token
  end
end
