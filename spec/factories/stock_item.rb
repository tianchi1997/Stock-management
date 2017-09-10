FactoryGirl.define do
  factory :stock_item do
    sequence(:name) { |n| "Stock Item #{n}" }
    sequence(:description) { |n| "Stock Item Description #{n}" }
    sequence(:supplier) { |n| "Stock Item Supplier #{n}" }
    expires false

    trait :expiry do
      expires true
    end

    trait :no_expiry do
      expires false
    end

    factory :stock_item_expiry, traits: [:expiry]
    factory :stock_item_no_expiry, traits: [:no_expiry]
  end

end
