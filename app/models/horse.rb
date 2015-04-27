class Horse < ActiveRecord::Base
  belongs_to :users

  has_many :tasks, dependent: :destroy
  validates :name, :breed, :RHR, :DOB, :height, :gender, :user_id, :weight, presence: true, length: { maximum: 100 }
  has_attached_file :pic, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => ":style/missing.png",
                    :storage => :s3,
                    :s3_credentials => Proc.new{|a| a.instance.s3_credentials}
  validates_attachment_content_type :pic, :content_type => /\Aimage\/.*\Z/

  default_scope { order(:name) }

  def s3_credentials
    {:bucket => "#{ENV["bucket"]}", :access_key_id => "#{ENV["access_key_id"]}", :secret_access_key => "#{ENV["secret_access_key"]}"}
  end
end