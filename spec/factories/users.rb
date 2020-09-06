FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    family_name           {'吉アあ'}
    first_name            {'梅イい'}
    family_name_kana      {'アイウエオ'}
    first_name_kana       {'カキクケコ'}
    birth_date            {'1995-05-27'}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    email                 {Faker::Internet.free_email}
    

  end
end