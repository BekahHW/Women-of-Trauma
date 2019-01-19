class UserDisorderTreatment < ApplicationRecord
  belongs_to :user_disorder
	belongs_to :treatment
end
