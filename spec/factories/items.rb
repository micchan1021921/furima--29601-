FactoryBot.define do
  factory :item do
     association :user
     name                       {"アイウエオ"}
     info                       {"アイウエオ"}
     category_id                {2}
     sales_status_id            {2}
     shippings_tee_status_id    {2}
     prefecture_id              {2}
     scheduled_delivary_id      {2}
     price                      {2000}
    
     after(:build) do |item|
      item.image.attach(io: File.open('public/images/item_image.png'),filename: 'item_image.png')
     end
  end
end