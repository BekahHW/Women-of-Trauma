class UserDisorder < ApplicationRecord
  belongs_to :user
	belongs_to :disorder
  # belongs_to :user_disorder_treatments

  validates :narrative, presence: true, length: { minimum: 250 }

#   accepts_nested_attributes_for :disorder
#
# # only creating a disorder if it's not already there
#   def disorder_attributes=(disorder_attributes)
#    disorder_attributes.values.each do |disorder_attribute|
#      disorder = Disorder.find_or_create_by(disorder_attribute)
#      self.disorders << disorder
#    end
#  end

end
