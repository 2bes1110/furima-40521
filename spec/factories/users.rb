FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.email }
    password              { "#{Faker::Internet.password(min_length: 4)}1a" }
    password_confirmation { password }
    last_name             { '山田' }
    first_name            { '太朗' }
    last_furigana         { 'ヤマダ' }
    first_furigana        { 'タロウ' }
    birthday              { Faker::Date.birthday(min_age: 18, max_age: 65) }
  end
end
