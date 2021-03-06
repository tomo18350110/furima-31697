FactoryBot.define do
  factory :item do
    image                { '*' }
    item_name            { '猫' }
    explanation          { '純正' }
    category_id          { 2 }
    condition_id         { 2 }
    shipping_charges_id  { 2 }
    shipping_area_id     { 2 }
    days_to_ship_id      { 2 }
    item_price           { 300 }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.jpg'), filename: 'test_image.png')
    end

  end
end
