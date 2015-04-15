class Horse < ActiveRecord::Base
  belongs_to :users
  has_many :tasks, dependent: :destroy
  validates :name, :breed, :RHR,  presence: true, length: { maximum: 50 }
  has_attached_file :pic, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :pic, :content_type => /\Aimage\/.*\Z/

end
