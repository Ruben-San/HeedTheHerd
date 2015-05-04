FactoryGirl.define do


  factory :horse do |f|
    f.name 'jerry'
    f.breed 'Andalusian'
    f.height 13.2
    f.DOB {Date.today - rand(1000).days}
    f.RHR 56
    f.gender 'gelding'
    f.association :user, :factory => :user
  end

     
end