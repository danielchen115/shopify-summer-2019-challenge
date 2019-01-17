FactoryBot.define do
  factory :product do
    title { Faker::Lorem.word }
    price { Faker::Number.decimal(2) }
    inventory_count { Faker::Number.between(1, 50)}
  end
end