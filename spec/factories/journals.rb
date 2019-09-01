FactoryBot.define do
  factory :journal do
    user { nil }
    name { "MyString" }
    description { "MyText" }
    password { BCrypt::Password.create('foo') }
    public { false }
  end
end
