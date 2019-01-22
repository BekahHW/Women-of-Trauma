class UserTherapist < ApplicationRecord
  belongs_to :user
  # belongs_to :therapist

  # def self.location
  #   UserTherapist.order(:location)
  # end
  scope :location, ->  { order(:location)}
# scope :therapist_name, -> {order(:name)}

end
