FactoryBot.define do
  factory :cart do
    user_id { Faker::Number.number(3) }
    total_amount { Faker::Number.decimal(2) }
    checkout_date { Faker::Date.between(2.days.ago, Date.today) }
  end
end