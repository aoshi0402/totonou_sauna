FactoryBot.define do
  factory :admin do
    email { "aaa@aaa" }
    password { "111111" }
    password_confirmation { "111111" }
  end
end