FactoryGirl.define do
  factory :item_expiry do
    transient do
      expires false
    end

    item { build(:item, expires: expires) }
    count 5
    expiry_date nil

    after(:build, :stub) do |item_expiry, evaluator|
      if evaluator.expires && item_expiry.expiry_date == nil
        item_expiry.expiry_date = Date.today + 2.weeks
      end
    end
  end
end
