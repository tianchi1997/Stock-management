FactoryGirl.define do
  factory :item_expiry do
    item
    count 5
    expires nil

    after(:build) do |item_expiry|
      if item_expiry.item.stock_item.expires
        item_expiry.expires = DateTime.now + 2.weeks
      else
        item_expiry.expires = nil
      end
    end
  end
end
