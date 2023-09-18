FactoryBot.define do
  factory :client do
    user
    type { 'Client' }
  end

  factory :trainer do
    user
    type { 'Trainer' }
  end
end
