class Trainer < User
  has_many :trainer_clients
  has_many :clients, through: :trainer_clients
end
