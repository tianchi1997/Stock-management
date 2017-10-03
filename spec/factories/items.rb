FactoryGirl.define do
  factory :item do
    transient do
      expires false
    end
    
    association :location, strategy: :build
    stock_item { build(:stock_item, expires: expires) }
    required 5
    order_to nil
  end
end
