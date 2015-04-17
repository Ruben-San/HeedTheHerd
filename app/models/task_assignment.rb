class TaskAssignment < ActiveRecord::Base
  belongs_to :horses
  belongs_to :tasks
  belongs_to :user
end
