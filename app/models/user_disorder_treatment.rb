class UserDisorderTreatment < ApplicationRecord
  belongs_to :user_disorder
	belongs_to :treatment
  has_many :disorders, through: user_disorders
  has_many :users, through: user_disorder
end
