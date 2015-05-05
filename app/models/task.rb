class Task < ActiveRecord::Base
  belongs_to :horses
  validates :horse_id, presence: true
  default_scope { order(:duedate) }
end