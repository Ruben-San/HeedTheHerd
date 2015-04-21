class User < ActiveRecord::Base
  has_many :horses, dependent: :destroy
  has_many :tasks, through: :horses
  validates :email, :password, presence: true
  # validates_length_of :zipcode, :minimum => 5, :maximum => 10

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable



  private
    def send_welcome_email
      UserMailer.welcome_email(self).deliver_later
    end



end
