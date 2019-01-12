class User < ApplicationRecord
  has_many  :user_disorders
  has_many  :user_disorder_treatments, through: :user_disorders
  has_many :disorders, through: :user_disorders

  has_secure_password

  validates :name, presence: true, uniqueness: true
end
