FactoryGirl.define do
  factory :stock_item do
    sequence(:item_code) { |n| "I#{n}" }
    sequence(:name) { |n| "Stock Item #{n}" }
    expires false
  end
end
