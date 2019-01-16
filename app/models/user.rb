class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many  :user_disorders
  has_many  :user_disorder_treatments, through: :user_disorders
  has_many :disorders, through: :user_disorders


  validates :name, presence: true, uniqueness: true
end
