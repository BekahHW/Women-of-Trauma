class UserDisorder < ApplicationRecord
  belongs_to :user
	belongs_to :disorder
  belongs_to :user_disorder_treatments
  has_many :treatments, through: :user_disorder_treatments

  validates :narrative, presence: true, length: { minimum: 250 }

end
