class Therapist < ApplicationRecord
  has_many :user_therapists
  has_many :users, through: :user_therapists
end
