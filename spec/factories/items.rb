FactoryBot.define do
  factory :item do
    name { Faker::Commerce.product_name }
    item_detail { Faker::Lorem.sentences }
    price { Faker::Number.between(from: 300, to: 9_999_999) }
    genre_id { Faker::Number.between(from: 2, to: 11) }
    item_condition_id { Faker::Number.between(from: 2, to: 7) }
    shipping_cost_burden_id { Faker::Number.between(from: 2, to: 3) }
    prefecture_id { Faker::Number.between(from: 2, to: 48) }
    shipping_day_id { Faker::Number.between(from: 2, to: 4) }

    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
