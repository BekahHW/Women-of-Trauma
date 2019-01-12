class Treatment < ApplicationRecord
  has_many :user_disorder_treatments
	has_many :user_disorders, through: :user_disorder_treatments

end
