FactoryGirl.define do
  factory :horse do
    name 'jerry'
    breed 'Andalusian'
    height 13.2
    weight 900
    DOB {Date.today - rand(1000).days}
    RHR 56
    gender 'gelding'
    user_id 1
  end
end