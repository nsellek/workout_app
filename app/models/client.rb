class Client < User
  has_one :trainer_client
  has_one :trainer, through: :trainer_client

  has_many :client_workouts
  has_many :workouts, through: :client_workouts
end
