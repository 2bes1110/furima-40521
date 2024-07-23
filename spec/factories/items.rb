FactoryBot.define do
  factory :item do
    before do
      @item = FactoryBot.create(:item)
      @order_shared = FactoryBot.build(:order_shared, user_id: @item.user.id, item_id: @item.id)
    end
    
    item_name              { 'テスト' }
    product_description    { 'テストします' }
    category_id            { 2 }
    product_condition_id   { 2 }
    shipping_fee_burden_id { 2 }
    shipping_region_id     { 2 }
    days_until_shipping_id { 2 }
    price                  { 300 }

    association :user
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
