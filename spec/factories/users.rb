FactoryGirl.define do
  factory :user do
    email "test1@test.com"
    encrypted_password "password"
    zipcode 12345
  end
end

