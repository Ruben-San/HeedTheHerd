class User < ActiveRecord::Base
  has_many :horses, dependent: :destroy
  has_many :tasks, through: :horses
  before_save   :downcase_email  
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  
  after_create :send_welcome_email

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  default_scope { order(:email) }

  private
    def downcase_email
      self.email = email.downcase
    end

    def send_welcome_email
      UserMailer.welcome_email(self).deliver_later
    end

end
