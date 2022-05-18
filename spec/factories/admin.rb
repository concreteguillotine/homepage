FactoryBot.define do
    factory :admin do
        sequence(:email) { |n| "test-#{n}@example.com" }
        password { "password" }

        trait :admin do
            admin { true }
        end
    end
end