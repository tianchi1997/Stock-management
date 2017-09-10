FactoryGirl.define do
  factory :item do
    location
    stock_item
    required 5
    order_to nil
  end
end
