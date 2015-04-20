class Task < ActiveRecord::Base
  # has_many :taskAssignments
  belongs_to :horses
  validates :horse_id, presence: true
  # accepts_nested_attributes_for :taskAssignments
  default_scope { order(:duedate) }
end