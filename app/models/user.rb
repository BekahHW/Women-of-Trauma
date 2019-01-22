class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, :omniauth_providers => [:github]

  # has_many :therapists
  # has_many :user_therapists, through: :therapists
  has_many  :user_disorders
  has_many  :user_disorder_treatments, through: :user_disorders
  has_many :disorders, through: :user_disorders


  validates :name, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true

  def self.from_omniauth(auth)
    # binding.pry
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      # user.provider = auth.provider
      # user.uid = auth.uid
      user.name = auth.info.nickname
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
    end
  end

end

self.Location
 Therapist.where(:location).order
end
