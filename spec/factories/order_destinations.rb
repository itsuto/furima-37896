FactoryBot.define do
  factory :order_destination do
    postcode { '123-4567' }
    prefecture_id { '2' }
    city { '新宿区' }
    block { '新宿１−３−５' }
    building { '新宿ビル' }
    phone_number { '09087654321' }
    token {"tok_abcdefghijk00000000000000000"}
  end
end
