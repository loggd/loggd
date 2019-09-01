FactoryBot.define do
  factory :user do
    handle { "MyString" }
    email { "foo@bar.com" }
    password { "yo,dawg" }
  end
end
