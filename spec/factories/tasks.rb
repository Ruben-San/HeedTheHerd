FactoryGirl.define do
  factory :task do
    name 'Coggins'
    description 'Text'
    duedate { Date.today + rand(500).days } 
    horse_id 1
  end
end