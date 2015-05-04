FactoryGirl.define do
  factory :user do
    email 'test8@test.com'
    password 'password'
    zipcode 84102
  end




trait :with_horse do
  after(:create) {|instance| create_list(:horse, 1, user: instance) }
  end

end