class Account < ApplicationRecord
  belongs_to :user

  TRAINER_TYPE = 'Trainer'.freeze
  CLIENT_TYPE = 'Client'.freeze

  def trainer?
    type == TRAINER_TYPE
  end

  def client?
    type == CLIENT_TYPE
  end
end
