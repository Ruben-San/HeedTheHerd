FactoryGirl.define do
  factory :horse do
    name 'jerry'
    breed 'Andalusian'
    height 13.2
    DOB {Date.today - rand(1000).days}
    RHR 56
    gender 'gelding'
  end
end