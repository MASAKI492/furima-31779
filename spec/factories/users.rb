FactoryBot.define do
  factory :user do
    nickname              { 'test' }
    email                 { Faker::Internet.free_email }
    password              { '1a' + Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    last_name             { '森' }
    first_name            { '正樹' }
    last_name_kana        { 'モリ' }
    first_name_kana       { 'マサキ' }
    birth_date            { Faker::Date.backward }
  end
end
