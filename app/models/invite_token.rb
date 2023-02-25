class InviteToken < ApplicationRecord
  belongs_to :trainer

  before_create :generate_token

  private

  def generate_token
    self.token = SecureRandom.alphanumeric(10)
  end
end
