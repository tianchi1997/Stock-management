FactoryGirl.define do
  factory :stock_item do
    sequence(:item_code) { |n| "I#{n}" }
    sequence(:name) { |n| "Stock Item #{n}" }
    sequence(:description) { |n| "Stock Item Description #{n}" }
    sequence(:supplier) { |n| "Stock Item Supplier #{n}" }
    expires false
  end
end
