class User < ActiveRecord::Base
  has_many :horses, dependent: :destroy
  has_many :tasks, through: :horses
  after_create :send_welcome_email
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  # validates :zipcode, presence: true
  # validates :email, :password, :zipcode, presence: true


  private
    def send_welcome_email
      UserMailer.welcome_email(self).deliver_later
    end



end
