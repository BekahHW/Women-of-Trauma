class UserTherapist < ApplicationRecord
  belongs_to :user
  before_save :capitalize_fields
  validates :name, presence: true
  validates :location, presence: true 


  scope :location, ->  { order(:location)}

  def capitalize_fields
   location.capitalize!
  end
end
