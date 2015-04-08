class User < ActiveRecord::Base
  has_many :horses, dependent: :destroy
  has_many :tasks, through: :horses
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
