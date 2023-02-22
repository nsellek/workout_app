class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
    :registerable,
    :recoverable,
    :rememberable,
    :validatable,
    :trackable

  USER_TYPES = %w[
    Trainer
    Client
  ].freeze

  validates :type, inclusion: USER_TYPES
  validates :first_name,
    :last_name,
    :email,
    presence: true

  TRAINER_TYPE = 'Trainer'.freeze
  CLIENT_TYPE = 'Client'.freeze

  def trainer?
    type == TRAINER_TYPE
  end

  def client?
    type == CLIENT_TYPE
  end
end
