FactoryBot.define do
    factory :article do
        title { "Example article" }
        description { "An example article" }
        association :author, factory: :admin
    end
end