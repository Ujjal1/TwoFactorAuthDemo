FactoryBot.define do
  factory :user do
    email { "MyString" }
    password_digest { "MyString" }
    otp_secret_key { "MyString" }
  end
end
