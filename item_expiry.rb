FactoryGirl.define do
  factory :item_expiry do
    item
    count 5

    if item.stock_item.expires
      expires DateTime.now + 2.weeks
    else
      expires nil
    end
  end
end
