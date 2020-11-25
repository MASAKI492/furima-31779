FactoryBot.define do
  factory :item do
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/sample1.png'), filename: 'sample1.png')
    end
    name                   { 'テスト' }
    info                   { Faker::Lorem.sentence }
    category_id            { 2 }
    sales_status_id        { 2 }
    price                  { 666 }
    shipping_fee_status_id { 2 }
    prefecture_id          { 2 }
    scheduled_delivery_id  { 2 }
    association :user
  end
end