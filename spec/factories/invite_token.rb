FactoryBot.define do
  factory :invite_token do
    token { SecureRandom.alphanumeric(10) }
  end
end
