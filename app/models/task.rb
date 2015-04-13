class Task < ActiveRecord::Base
  has_many :horses, through: :taskassociations
  
end
