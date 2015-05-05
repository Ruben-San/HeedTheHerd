FactoryGirl.define do
  factory :horse do |f|
    f.name Faker::Name
    f.breed Faker::Name
    f.height 13.2
    f.DOB {Date.today - rand(1000).days}
    f.RHR 56
    f.gender 'gelding'
    f.id 1
    f.user_id 1
  end
end