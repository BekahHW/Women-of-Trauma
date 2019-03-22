class Therapist < ApplicationRecord
  # validates :phone_number, format: { with: /\d{3}-\d{3}-\d{4}/, message: "Format XXX-XXX-XXXX" }

  # has_many :user_therapists
  # has_many :users, through: :user_therapists
end
