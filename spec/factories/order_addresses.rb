FactoryBot.define do
  factory :order_address do
    post_code { Faker::Base.regexify(/\d{3}-\d{4}/) }
    prefecture_id { Faker::Number.between(from: 2, to: 48) }
    city { Faker::Address.city }
    address_line { Faker::Address.street_address }
    building_name {  Faker::Company.name }
    tel_number { Faker::Number.number(digits: [10, 11].sample) }
    token { Faker::Alphanumeric.alphanumeric(number: 30) }
  end
end
