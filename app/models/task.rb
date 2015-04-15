class Task < ActiveRecord::Base
  # has_many :taskAssignments
  belongs_to :horses

  # accepts_nested_attributes_for :taskAssignments
  
end
