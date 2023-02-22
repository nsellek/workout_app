class Client < User
  has_one :trainer_client
  has_one :trainer, through: :trainer_client
end
