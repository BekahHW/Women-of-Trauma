class UserTherapist < ApplicationRecord
  belongs_to :user
  before_save :capitalize_fields

  scope :location, ->  { order(:location)}

  def capitalize_fields
   location.capitalize!
  end
end
