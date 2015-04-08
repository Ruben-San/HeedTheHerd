class Horse < ActiveRecord::Base
  belongs_to :users
  has_many :tasks, dependent: :destroy
end
