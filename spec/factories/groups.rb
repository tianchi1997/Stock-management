FactoryGirl.define do
  factory :group do
    sequence(:name) { |n| "Group #{n}" }
    sequence(:description) { |n| "Group Description #{n}" }
  end
end

