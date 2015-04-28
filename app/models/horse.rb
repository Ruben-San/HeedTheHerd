class Horse < ActiveRecord::Base
  belongs_to :users

  has_many :tasks, dependent: :destroy
  has_many :horse_weights, dependent: :destroy
  validates :name, :breed, :RHR, :DOB, :height, :gender, :user_id, presence: true, length: { maximum: 100 }
  has_attached_file :pic, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => ":style/missing.png"
  validates_attachment_content_type :pic, :content_type => /\Aimage\/.*\Z/

  default_scope { order(:name) }
end