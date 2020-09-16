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
    # purchase_id          {Faker::Number.between(2, 4)}

    # postal_code          {"333-4444"}
    # prefectures          {2}
    # municipalities       {"大阪市天王寺区"}
    # address              {"3-9-11"}
    # building_name        {"大阪ビル"}
    # phone_number         {"12345678333"}
    # token                {"aaaaaa"}
    # # purchase_id          {Faker::Number.between(2, 4)}
  end
end
