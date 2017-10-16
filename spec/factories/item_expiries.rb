FactoryGirl.define do
  factory :item_expiry do
    transient do
      expires false
    end

    sequence :expiry_date do |n|
      if expires
        Date.today + n.weeks
      else
        nil
      end
    end

    item { build(:item, expires: expires) }
    count 5
  end
end
