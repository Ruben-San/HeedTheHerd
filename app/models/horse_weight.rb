class HorseWeight < ActiveRecord::Base
  belongs_to :horses
  validates :horse_id, :weight, presence: true 
end