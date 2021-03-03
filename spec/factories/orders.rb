require 'faker'

FactoryBot.define do
  factory :order do
    product_name { Faker::Lorem.word }
    product_count { Faker::Number.number(digits: 2).to_i }
    association :customer
  end
end
