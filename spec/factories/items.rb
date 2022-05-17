FactoryBot.define do
  factory :item do
    name { '商品名テスト' }
    info { 'こんな商品です' }
    category_id { '3' }
    condition_id { '4' }
    delibery_burden_id { '2' }
    prefecture_id { '2' }
    shipping_date_id { '2' }
    price { 2000 }
    association :user
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
