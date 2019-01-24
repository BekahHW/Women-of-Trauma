class UserTherapist < ApplicationRecord
  belongs_to :user
  # belongs_to :therapist
  before_save :capitalize_fields

  # def self.location
  #   UserTherapist.order(:location)
  # end
  scope :location, ->  { order(:location)}
# scope :therapist_name, -> {order(:name)}
def capitalize_fields
 location.capitalize!
end
end
