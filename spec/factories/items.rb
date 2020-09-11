FactoryBot.define do
  factory :item do
    # content {Faker::Lorem.sentence}
    association :user
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end

    goods              {Faker::String.random(length: 40)}
    price              {Faker::Number.number(digits: 7)}
    condition_id       {Faker::Number.between(2, 7)}
    delivery_fee_id      {Faker::Number.between(2, 3)}
    origin_area_id       {Faker::Number.between(2, 48)}
    shipment_date_id     {Faker::Number.between(2, 4)}
    shipper_comment      {Faker::String.random(length: 1000)}
    category_id         {Faker::Number.between(2, 4)}
  end
end
