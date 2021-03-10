FactoryBot.define do
    factory :organization do
      name { "Carnegie Mellon University" }
      street_1 { "4800 Forbes Ave" }
      street_2 { "Hamburg 3001" }
      city { "Pittsburgh" }
      state { "PA" }
      zip { 15213 }
      short_name { "CMU" }
      active { true }
    end
  end