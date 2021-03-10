FactoryBot.define do
    factory :team do
      name { "CMU 1" }
      association :organization
      division { "senior" }
      active { true }
    end
  end