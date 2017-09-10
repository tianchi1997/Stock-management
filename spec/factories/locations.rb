FactoryGirl.define do
  factory :location do
    sequence(:name) { |n| "Location #{n}" }
    sequence(:description) { |n| "Location Description #{n}" }
    association :group, strategy: :build
  end
end
