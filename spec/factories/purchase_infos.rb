FactoryBot.define do
  factory :purchase_info do
    association :user
    association :item

    postal_code          {"333-4444"} # {Faker::Number.between(2, 7)}
    prefectures          {Faker::Number.between(2, 48)}
    municipalities       {Faker::String.random(length: 50)}
    address              {Faker::String.random(length: 100)}
    building_name        {Faker::String.random(length: 100)}
    phone_number         {Faker::Number.number(digits: 11)}
    token                {Faker::String.random(length: 100)}
  end
end
