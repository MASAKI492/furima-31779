FactoryBot.define do
  factory :address_order do
    postal_code { '123-4567' }
    prefecture_id { '0' }
    city { '東京都' }
    addresses {'111'}
    phone_number {'09012345678'}
    token {'0x00007f879ee37880'}

    
  end
end
