FactoryGirl.define do
  factory :user do
    sequence(:name) { |n| "Name #{n}" }
    sequence(:email) { |n| "email-#{n}@example.com" }
    sequence(:password) { |n| "password#{n}" }
    permission_level 0
  end
end

