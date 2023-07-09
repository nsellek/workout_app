class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
    :registerable,
    :recoverable,
    :rememberable,
    :validatable,
    :trackable

  has_one :trainer, dependent: :destroy
  has_one :client, dependent: :destroy

  USER_TYPES = %w[
    Trainer
    Client
  ].freeze

  validates :first_name,
    :last_name,
    :email,
    presence: true
end
