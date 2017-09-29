FactoryGirl.define do
  factory :user do
    sequence(:name) { |n| "Name #{n}" }
    sequence(:email) { |n| "email-#{n}@example.com" }
    sequence(:password) { |n| "password#{n}" }
    permission_level 0

    factory :report_user do
        permission_level 1
    end

    factory :admin do
        permission_level 2
    end
  end
end

